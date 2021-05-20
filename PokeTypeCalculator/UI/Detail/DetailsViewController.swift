//
//  DetailsViewController.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 5/19/21.
//

import UIKit
import SwiftUI

class DetailsViewController: UIViewController {
    
    private lazy var mainView = DetailView(viewModel: viewModel)
    private let viewModel: DetailsViewModel
    private lazy var hostingController = UIHostingController(rootView: mainView)
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupChildViewController()
    }
    
    private func setupChildViewController() {
        self.add(hostingController, parentView: self.view)
    }
}
