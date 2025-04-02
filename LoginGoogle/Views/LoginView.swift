//
//  LoginView.swift
//  LoginGoogle
//
//  Created by Paul Jaime Felix Flores on 29/07/24.
//

import SwiftUI
//Vid 301,
struct LoginView: View {
    
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        VStack(alignment: .center){
            Text("Login Google")
                .fontWeight(.black)
                .foregroundColor(.red)
                .font(.largeTitle)
            GoogleButton()
                .onTapGesture {
                    viewModel.signIn()
                }
        }.padding()
    }
}


#Preview {
    LoginView()
    // Proveer el ViewModel como un objeto de entorno
        .environmentObject(AuthViewModel())
}

