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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupChildViewController()
    }
    
    private func setupChildViewController() {
        self.add(hostingController, parentView: self.view)
    }
}
