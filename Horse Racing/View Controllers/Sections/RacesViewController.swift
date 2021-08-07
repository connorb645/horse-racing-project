//
//  ViewController.swift
//  Horse Racing
//
//  Created on 30/07/2021.
//

import UIKit

class RacesViewController: UIViewController, BottomSheetAttachable, RacesViewModelDelegate {
    lazy var fileReader = FileReader()
    lazy var jsonFileDecoder = JsonFileDecoder()
    lazy var racesDataFetcher = RacesDataFetcher(fileReader: fileReader, jsonFileDecoder: jsonFileDecoder)
    
    lazy var racesCollectionView = InsetGroupedCollectionView()
    lazy var racesViewModel = RacesViewModel(dataFetcher: racesDataFetcher)
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Race>?
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = racesCollectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        racesViewModel.delegate = self
        configureCollectionView()
        racesViewModel.fetchRaces()
    }
    
    func configureNavigationBar() {
        title = "Races"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, Race> { cell, indexPath, race in
            var content = cell.defaultContentConfiguration()
            content.text = race.raceSummary.name
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Race>(collectionView: racesCollectionView.collectionView) { collectionView, indexPath, race in
            return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: race)
        }
    }
    
    private func populateDataSourceAndSetViewState(withRaces races: [Race], forState state: ViewState<Race>) {
        populateDataSource(with: races) { [weak self] in
            self?.racesCollectionView.setState(state)
        }
    }
    
    private func populateDataSource(with races: [Race], completion: @escaping () -> ()) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Race>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(races)
        dataSource?.apply(snapshot, animatingDifferences: true, completion: completion)
    }
    
    // MARK: - RacesViewModelDelegate
    
    func receivedStateChange(state: ViewState<Race>) {
        switch state {
        case .successful(let races):
            populateDataSourceAndSetViewState(withRaces: races, forState: state)
        default:
            populateDataSourceAndSetViewState(withRaces: [], forState: state)
        }
    }
    
    // MARK: - BottomSheetAttachable
    
    var viewControllerToPresent: UIViewController {
        get {
            return RacesViewController()
        }
    }
}

extension RacesViewController {
    enum Section: CaseIterable {
        case races
    }
}
