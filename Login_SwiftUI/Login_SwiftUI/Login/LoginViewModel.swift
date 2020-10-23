//
//  LoginViewModel.swift
//  Login_SwiftUI
//
//  Created by home on 2020/10/23.
//

import Combine

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""
    @Published var isValidText: Bool = false
    
    private var disposables = [AnyCancellable]()
    
    init() {
        $id
            .sink(receiveValue: {
                if !$0.isAlphanumeric && !$0.isEmpty {
                    self.isValidText = false
                } else {
                    self.isValidText = true
                }
            })
            .store(in: &disposables)
        
        $password
            .sink(receiveValue: {
                if !$0.isAlphanumeric && !$0.isEmpty {
                    self.isValidText = false
                } else {
                    self.isValidText = true
                }
            })
            .store(in: &disposables)
    }
}
