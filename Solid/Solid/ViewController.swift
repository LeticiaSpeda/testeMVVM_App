//
//  ViewController.swift
//  Solid
//
//  Created by Leticia Speda on 19/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewModel: ViewModeling
    private let service: Service
    
    init(viewModel: ViewModeling, service: Service) {
        self.viewModel = viewModel
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.load()
        service.callAPI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let controller = RetainCycleController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
