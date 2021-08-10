//
//  BottomSheetDataSource.swift
//  Horse Racing
//
//  Created on 04/08/2021.
//

import UIKit

/// Attach to the View Controller which should have the ability to present a bottom sheet
/// 'BottomSheetAttachable' requires this protocol to be conformed to, therefore conformance to 'BottomSheetAttachable' will be enough
protocol BottomSheetDataSource: AnyObject {
    /// Ask the presenting View Controller to supply the view controller it wants the bottom sheet to host.
    var viewControllerToPresent: UIViewController? { get }
    /// Ask the presenting View Controller to supply how dim the background should be for the space above the bottom sheet.
    var backgroundDim: CGFloat { get }
    /// Ask the presenting View Controller to supply what percentage of the container view is visible
    var defaultVisibility: CGFloat { get }
    /// Ask the presenting View Controller to supply the amount of top space should remain when the bottom sheet is fully expanded.
    var topPadding: CGFloat { get }
}

extension BottomSheetDataSource {
    /// A sensible default for background dimming
    var backgroundDim: CGFloat {
        return 0.6
    }
    
    /// A sensible default for the default height
    var defaultVisibility: CGFloat {
        return 0.5
    }
    
    /// A sensible default for the top padding
    var topPadding: CGFloat {
        return 100
    }
}
