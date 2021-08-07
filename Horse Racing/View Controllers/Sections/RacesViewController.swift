//
//  ViewController.swift
//  Horse Racing
//
//  Created on 30/07/2021.
//

import UIKit

class RacesViewController: UIViewController, BottomSheetAttachable, RacesViewModelDelegate {
    
    // MARK: - Properties
    
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
    
    // MARK: - Configuration
    
    func configureNavigationBar() {
        title = "Races"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    /// Registers the cell with the collection view,
    /// configures the cells content,
    /// configures and keeps hold of the data source so we can apply snapshot changes in the future
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
    
    // MARK: - Utils
    
    /// Helper function to reduce code duplication, will be called from state changes.
    /// - Parameters:
    ///   - races: The races to be displayed if the state is successful, otherwise races should be an empty array
    ///   - state: The current state of the view, determined by RacesViewModel
    private func populateDataSourceAndSetViewState(withRaces races: [Race], forState state: ViewState<Race>) {
        populateDataSource(with: races) { [weak self] in
            self?.racesCollectionView.setState(state)
        }
    }
    
    /// Applies a new snapshot to the datasource in order to refresh the collection view.
    /// - Parameters:
    ///   - races: The new array of races
    ///   - completion: Completion will be called when the dataSource animation changes have been made.
    /// - Returns: Void
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
