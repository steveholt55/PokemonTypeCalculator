//
//  SearchListViewController.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 5/5/21.
//

import UIKit
import SwiftUI

class SearchListViewController: UIViewController {
    
    private lazy var mainView = SearchListView(viewModel: viewModel)
    private let viewModel: SearchListViewModel
    private lazy var hostingController = UIHostingController(rootView: mainView)
    
    init(viewModel: SearchListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupChildViewController()
    }
    
    private func setupChildViewController() {
        self.add(hostingController, parentView: self.view)
    }
}
