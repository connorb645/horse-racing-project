//
//  ModalContainerViewController.swift
//  Horse Racing
//
//  Created on 01/08/2021.
//

import UIKit

class ModalContainerViewController: UIViewController, ModalContainerViewDelegate {
    var dataSource: BottomSheetDataSource?
    
    private var modalContainerView: ModalContainerView?
    
    override func loadView() {
        
        guard let dataSource = dataSource, let viewControllerToPresent = dataSource.viewControllerToPresent else {
            fatalError("You are attempting to present a bottom sheet without specifiying any data points. Try implementing the BottomSheetAttachable protocol on your presenting view controller.")
        }
        
        addChild(viewControllerToPresent)
        
        modalContainerView = ModalContainerView(childViewController: viewControllerToPresent, backgroundDim: dataSource.backgroundDim, topPaddingWhenExpanded: dataSource.topPadding, defaultVisibility: dataSource.defaultVisibility, delegate: self)
                
        view = modalContainerView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        modalContainerView?.animatePresentation()
    }
    
    // MARK: - ModalContainerViewDelegate
    
    func dismissModal() {
        modalContainerView?.animateDismissal {
            self.dismiss(animated: false)
        }
    }
    
}
