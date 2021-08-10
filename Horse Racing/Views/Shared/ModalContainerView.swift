//
//  ModalContainerView.swift
//  Horse Racing
//
//  Created on 03/08/2021.
//

import UIKit

class ModalContainerView: UIView {
    
    /// The container view which will host the provided view controller
    lazy private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    /// The backdrop view which will dim out content in the background
    lazy private var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = backgroundDim
        view.addGestureRecognizer(dimmedViewTap)
        return view
    }()
    
    /// The small handle view to show the container is draggable
    lazy private var handleView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.alpha = 0.2
        view.layer.cornerRadius = handleViewHeight / 2
        return view
    }()
    
    private var containerViewBottomConstraint: NSLayoutConstraint?
    
    private let handleViewHeight: CGFloat = 6
    private let handleViewWidth: CGFloat = 45
    
    lazy private var dimmedViewTap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        
    private var currentBottomConstraint: CGFloat
    private let containerHeight: CGFloat
    private let defaultBottomConstraint: CGFloat
    private let defaultVisibility: CGFloat
    private let dismissBottomConstraint: CGFloat
    private let backgroundDim: CGFloat
    
    private(set) weak var delegate: ModalContainerViewDelegate?
    
    /// Initializer used to create a ModalContainerView
    /// - Parameters:
    ///   - childViewController: The view controller which will be displayed in the modal container
    ///   - backgroundDim: The amount the background will be dimmed
    ///   - defaultHeight: The default height of the container view
    ///   - dismissibleHeight: The height which will trigger the container dismissal
    ///   - topPaddingWhenExpanded: The amount of top padding when the container view is fully expanded along the y axis
    ///   - delegate: The delegate which will handle any action events
    init(childViewController: UIViewController,
         backgroundDim: CGFloat,
         topPaddingWhenExpanded: CGFloat,
         defaultVisibility: CGFloat,
         delegate: ModalContainerViewDelegate?) {
        
        self.backgroundDim = backgroundDim
        self.defaultVisibility = 0.4
        let dismissThreshold: CGFloat = 0.2
        self.containerHeight = UIScreen.main.bounds.height - topPaddingWhenExpanded
        self.currentBottomConstraint = (1.0 - self.defaultVisibility) * self.containerHeight
        self.defaultBottomConstraint = self.currentBottomConstraint
        self.dismissBottomConstraint = (1.0 - dismissThreshold) * self.containerHeight
        
        self.delegate = delegate
        
        super.init(frame: .zero)
        
        configureView()
        configureConstraints(childViewController: childViewController)
        configurePanGestureRecognizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Storyboard initialization not implemented for ModalContainerView")
    }
    
    func configureView() {
        backgroundColor = .clear
    }
    
    /// Configure the constraints and reside the container view top constraint and bottom constraint ready for manipulation.
    /// - Parameter childViewController: The view controller to be displayed within the bottom sheet container
    func configureConstraints(childViewController: UIViewController) {
        addSubview(dimmedView)
        addSubview(containerView)
        containerView.addSubview(childViewController.view)
        containerView.addSubview(handleView)
        
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        handleView.translatesAutoresizingMaskIntoConstraints = false
        
        dimmedView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dimmedView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        dimmedView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        dimmedView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: containerHeight).isActive = true
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: defaultBottomConstraint)
        
        containerViewBottomConstraint?.isActive = true
        
        handleView.widthAnchor.constraint(equalToConstant: handleViewWidth).isActive = true
        handleView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        handleView.heightAnchor.constraint(equalToConstant: handleViewHeight).isActive = true
        handleView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        
        childViewController.view.anchor(top: handleView.bottomAnchor, paddingTop: 20, bottom: containerView.bottomAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor)
    }
    
    func configurePanGestureRecognizer() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(gesture:)))
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        let isDraggingDown = translation.y > 0
        
        let newBottomConstraint = currentBottomConstraint + translation.y
                
        switch gesture.state {
        case .changed: // When dragging
            // If the constraint is 0, we have dragged the view out to the top
            if newBottomConstraint >= 0 {
                containerViewBottomConstraint?.constant = newBottomConstraint
                layoutIfNeeded()
            }
        case .ended: // Stopped dragging
            if newBottomConstraint > dismissBottomConstraint {
                delegate?.dismissModal()
            } else if newBottomConstraint > defaultBottomConstraint {
                animateContainer(toBottomConstraint: defaultBottomConstraint)
            } else if newBottomConstraint >= 0 && isDraggingDown {
                animateContainer(toBottomConstraint: defaultBottomConstraint)
            } else if newBottomConstraint >= 0 && !isDraggingDown {
                animateContainer(toBottomConstraint: 0)
            }
        default:
            break
        }
    }
    
    func animateContainer(toBottomConstraint constant: CGFloat) {
        UIView.animate(withDuration: 0.4) {
            self.containerViewBottomConstraint?.constant = constant
            self.layoutIfNeeded()
        }
        currentBottomConstraint = constant
    }
    
    /// This will be called from this views controlling View Controller in the viewDidAppear()
    /// After presenting this views controlling View Controller without animation, this method will nicely transition in the relevant views.
    func animatePresentation() {
        containerViewBottomConstraint?.constant = containerHeight
        self.layoutIfNeeded()
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.defaultBottomConstraint
            self.layoutIfNeeded()
        }
        
        dimmedView.alpha = 0.0
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = self.backgroundDim
        }
    }
    
    /// This will be triggered when the bottom sheet should dismiss.
    /// The completion handler is required so that this views controlling View Controller can dismiss it self without animation after the relevant
    /// views have been transitioned off-screen.
    func animateDismissal(completion: @escaping () -> ()) {
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.containerHeight
            self.layoutIfNeeded()
        }
        
        dimmedView.alpha = backgroundDim
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = 0.0
        } completion: { _ in
            completion()
        }
    }
    
    @objc func handleTap() {
        delegate?.dismissModal()
    }
}
