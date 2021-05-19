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
    let viewModel = SearchListViewModel()
    private lazy var hostingController = UIHostingController(rootView: mainView)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupChildViewController()
    }
    
    private func setupChildViewController() {
        self.add(hostingController, parentView: self.view)
    }
}
