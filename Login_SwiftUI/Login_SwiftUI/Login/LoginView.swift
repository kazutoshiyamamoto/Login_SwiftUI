//
//  LoginView.swift
//  Login_SwiftUI
//
//  Created by home on 2020/10/21.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25, content: {
            Text("アカウントIDでログイン")
            
            TextField("IDを入力", text: $viewModel.id)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300)
            
            TextField("パスワードを入力", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300)
            
            if !viewModel.isValidText {
                Text("半角英数字で入力してください")
                    .foregroundColor(Color.red)
            VStack(alignment: .center) {
                Button(action: {
                    viewModel.isLoginButtonTapped = true
                }) {
                    Text("ログイン")
                        .frame(width: 200, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(10, antialiased: true)
                }
            }
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
