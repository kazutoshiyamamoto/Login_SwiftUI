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
        VStack {
            VStack(alignment: .leading, spacing: 15, content: {
                Text("アカウントIDでログイン")
                    .font(.headline)
                
                // 入力文字が半角英数以外の場合はエラーメッセージを画面に表示
                if !viewModel.isValidId || !viewModel.isValidPassword {
                    Text("半角英数字で入力してください")
                        .font(.subheadline)
                        .foregroundColor(Color.red)
                }
                
                // 入力した文字をLoginViewModelの変数idに通知
                TextField("IDを入力", text: $viewModel.id)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300)
                
                // 入力した文字をLoginViewModelの変数passwordに通知
                TextField("パスワードを入力", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300)
            })
            .padding(20)
            
            VStack(alignment: .center) {
                Button(action: {
                    // ボタンが選択されたことをLoginViewModelの変数isLoginButtonTappedに通知
                    viewModel.isLoginButtonTapped = true
                }) {
                    Text("ログイン")
                        .frame(width: 200, height: 50)
                        .foregroundColor(Color.white)
                        // ボタンの有効/無効状態に合わせて背景の色を変更
                        .background(viewModel.isValidId && viewModel.isValidPassword ? Color.blue : Color.gray)
                        .cornerRadius(10, antialiased: true)
                }
                // IDとパスワードがどちらも半角英数で入力されていればボタンを有効にする
                .disabled(!viewModel.isValidId || !viewModel.isValidPassword)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
