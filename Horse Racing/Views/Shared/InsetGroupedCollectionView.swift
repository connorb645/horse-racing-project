//
//  RacesView.swift
//  Horse Racing
//
//  Created on 03/08/2021.
//

import Foundation
import UIKit

class InsetGroupedCollectionView: UIView {
    lazy var collectionView: UICollectionView = {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGroupedBackground
        return collectionView
    }()
    
    lazy var stackContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textView])
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14)
        textView.isEditable = false
        textView.textAlignment = .justified
        return textView
    }()
        
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemGroupedBackground
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Storyboard initialization not implemented for InsetGroupedCollectionView")
    }
    
    private func configureConstraints() {
        addSubview(collectionView)
        addSubview(stackContainerView)
        
        let safeArea = safeAreaLayoutGuide
        
        collectionView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor)
        stackContainerView.anchor(top: safeArea.topAnchor, paddingTop: 16, bottom: safeArea.bottomAnchor, paddingBottom: 16, left: safeArea.leftAnchor, paddingLeft: 16, right: safeArea.rightAnchor, paddingRight: 16)
        
        stackContainerView.addSubview(infoStackView)
        
        infoStackView.anchor(top: stackContainerView.topAnchor, paddingTop: 16, bottom: stackContainerView.bottomAnchor, paddingBottom: 16, left: stackContainerView.leftAnchor, paddingLeft: 16, right: stackContainerView.rightAnchor, paddingRight: 16)
    }
    
    func setState<T: Hashable>(_ state: ViewState<T>) {
        switch state {
        case .empty:
            setInfoState(message: "Hmm, it looks like you're missing some data")
        case .successful(_):
            setItemsState()
        case .failed(let message):
            setInfoState(message: message)
        }
    }
    
    private func setInfoState(message: String) {
        textView.text = message
        collectionView.isHidden = true
        stackContainerView.isHidden = false
    }
    
    private func setItemsState() {
        stackContainerView.isHidden = true
        collectionView.isHidden = false
    }
}
