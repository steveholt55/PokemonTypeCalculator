//
//  CalculatorViewController.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 5/18/21.
//

import UIKit
import SwiftUI
import Combine

class CalculatorViewController: UIViewController {
    
    let viewModel: CalculatorViewModel
    lazy var mainView = CalculatorView(viewModel: viewModel)
    
    private lazy var hostingController = UIHostingController(rootView: mainView)
    private var disposeBag: [AnyCancellable] = []
    
    init(viewModel: CalculatorViewModel = CalculatorViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupObservables()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupChildViewController()
    }
    
    private func setupChildViewController() {
        self.add(hostingController, parentView: self.view)
    }
    
    // MARK: - Combine
    
    private func setupObservables() {
        self.setupShowSearchViewSubject()
    }
    
    private func setupShowSearchViewSubject() {
        self.viewModel.showSearchViewSubject.sink { [weak self] search in
            self?.showSearchViewController()
        }
        .store(in: &disposeBag)
    }
    
    private func showSearchViewController() {
        let searchViewController = SearchListViewController()
        searchViewController.viewModel.itemSelectedSubject.sink { [weak self] item in
            self?.viewModel.getPokemon(item.name)
            searchViewController.dismiss(animated: true, completion: nil)
        }
        .store(in: &disposeBag)
        self.present(searchViewController, animated: true, completion: nil)
    }
}
