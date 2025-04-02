//
//  LoginView.swift
//  LoginGoogle
//
//  Created by Paul Jaime Felix Flores on 29/07/24.
//

import SwiftUI

//V-301,paso 1.12
struct LoginView: View {
    
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        VStack(alignment: .center){
            Text("Login Google")
                .fontWeight(.black)
                .foregroundColor(.blue)
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

