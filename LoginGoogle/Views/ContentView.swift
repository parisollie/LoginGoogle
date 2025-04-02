//
//  ContentView.swift
//  LoginGoogle
//
//  Created by Paul Jaime Felix Flores on 29/07/24.
//

import SwiftUI

struct ContentView: View {
    
    //Paso 1.9 ,
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        Group {
            //paso 1.10
            if viewModel.loginState {
                //en caso de true nos vamos
                HomeView()
            }else {
                //en caso de false vamos a
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
