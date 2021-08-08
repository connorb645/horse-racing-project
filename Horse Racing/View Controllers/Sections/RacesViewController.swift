//
//  ViewController.swift
//  Horse Racing
//
//  Created on 30/07/2021.
//

import UIKit
import SwiftUI

class RacesViewController: UIViewController, BottomSheetAttachable, StateChangeDelegate {
    
    typealias RacesDataSource = UICollectionViewDiffableDataSource<Section, Race>
    
    // MARK: - Properties
    
    private let racesViewModel: RacesViewModelAbstraction
    private let racesView: InsetGroupedCollectionViewAbstraction
    
    private var dataSource: RacesDataSource?
    
    private var selectedRace: Race?
    
    // MARK: - Life Cycle
    
    init(viewModel: RacesViewModelAbstraction, view: InsetGroupedCollectionViewAbstraction) {
        self.racesViewModel = viewModel
        self.racesView = view
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func loadView() {
        view = racesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        racesViewModel.setStateChangeDelegate(to: self)
        configureCollectionView()
        racesViewModel.fetchRaces()
    }
    
    // MARK: - Configuration
    
    private func configureNavigationBar() {
        title = "Races"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    /// Registers the cell with the collection view,
    /// configures the cells content,
    /// configures and keeps hold of the data source so we can apply snapshot changes in the future
    private func configureCollectionView() {
        racesView.collectionView.register(UINib(nibName: OverviewCollectionViewCell.reuseIdentifier, bundle: .main), forCellWithReuseIdentifier: OverviewCollectionViewCell.reuseIdentifier)
        racesView.collectionView.delegate = self
        dataSource = RacesDataSource(collectionView: racesView.collectionView) { collectionView, indexPath, race in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OverviewCollectionViewCell.reuseIdentifier, for: indexPath) as? OverviewCollectionViewCell else {
                fatalError("Failed to deque reusable cell of type OverviewCollectionViewCell")
            }
            cell.configureWith(title: race.overview)
            return cell
        }
    }
    
    // MARK: - Utils
    
    /// Helper function to reduce code duplication, will be called from state changes.
    /// - Parameters:
    ///   - races: The races to be displayed if the state is successful, otherwise races should be an empty array
    ///   - state: The current state of the view, determined by RacesViewModel
    private func populateDataSourceAndSetViewState(withRaces races: [Race], forState state: ViewState<Race>) {
        racesView.setState(state)
        populateDataSource(with: races)
    }
    
    /// Applies a new snapshot to the datasource in order to refresh the collection view.
    /// - Parameters:
    ///   - races: The new array of races
    ///   - completion: Completion will be called when the dataSource animation changes have been made.
    /// - Returns: Void
    private func populateDataSource(with races: [Race]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Race>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(races)
        dataSource?.apply(snapshot)
    }
    
    // MARK: - StateChangeDelegate
    
    func stateChanged<T: Hashable>(to state: ViewState<T>) {
        guard let state = state as? ViewState<Race> else { return }
        
        switch state {
        case .successful(let races):
            populateDataSourceAndSetViewState(withRaces: races, forState: state)
        default:
            populateDataSourceAndSetViewState(withRaces: [], forState: state)
        }
    }
    
    // MARK: - BottomSheetAttachable
    
    var viewControllerToPresent: UIViewController? {
        get {
            guard let race = selectedRace else { return nil }
            let raceDetailViewModel = RaceDetailViewModel(race: race)
            let raceDetailView = RaceDetailView(viewModel: raceDetailViewModel)
            let raceDetailHostingController = UIHostingController<RaceDetailView>(rootView: raceDetailView)
            return raceDetailHostingController
        }
    }
}

extension RacesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let race = dataSource?.itemIdentifier(for: indexPath) else { return }
        selectedRace = race
        displayBottomSheet()
    }
}

extension RacesViewController {
    enum Section: CaseIterable {
        case races
    }
}
