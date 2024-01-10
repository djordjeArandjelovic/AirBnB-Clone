//
//  ExplorerViewModel.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 10.1.24..
//

import Foundation

class ExplorerViewModel: Observable {
    @Published var listings = [Listing]()
    
    init() {
        
    }
    
    func fetchListings() async {
        
    }
}
