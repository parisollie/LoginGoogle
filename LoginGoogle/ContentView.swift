//
//  ContentView.swift
//  LoginGoogle
//
//  Created by Paul Jaime Felix Flores on 29/07/24.
//

import SwiftUI

struct ContentView: View {
    
    //Vid 300 ,
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.loginState {
                HomeView()
            }else {
                //Vid 300 , en caso de false vamos a 
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
