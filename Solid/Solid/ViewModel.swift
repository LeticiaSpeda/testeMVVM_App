//
//  ViewModel.swift
//  Solid
//
//  Created by Leticia Speda on 19/10/23.
//

import Foundation

protocol ViewModeling {
    func load()
}

protocol Service {
    func callAPI()
}

protocol Formatter {
    func format()
}

class ViewModel: ViewModeling, Service {
    func callAPI() {
        print("Chamando API na viewModel ....")
    }
    
    func load() {
        print("Carregando viewModel ....")
    }
}

class PremiumViewModel: ViewModeling {
    func load() {
        print("Carregando uma super viewModel ....")
    }
}



    

