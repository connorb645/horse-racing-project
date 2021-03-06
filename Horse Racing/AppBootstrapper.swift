//
//  AppBootstrapper.swift
//  Horse Racing
//
//  Created on 08/08/2021.
//

import UIKit
import SwiftUI

class AppBootstrapper {

    // MARK: - Races View Controller Init
    
    lazy var fileReader = FileReader()
    lazy var jsonFileDecoder = JsonFileDecoder()
    lazy var racesDataFetcher = RacesDataFetcher(fileReader: fileReader, jsonFileDecoder: jsonFileDecoder)

    lazy var racesView = InsetGroupedCollectionView()
    lazy var racesViewModel = RacesViewModel(dataFetcher: racesDataFetcher)
    
    lazy var racesViewController = RacesViewController(viewModel: racesViewModel, view: racesView)

    func bootstrap(window: UIWindow) -> UIWindow {
        let navigationController = UINavigationController(rootViewController: racesViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return window
    }
}
