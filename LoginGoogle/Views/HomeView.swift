//
//  HomeView.swift
//  LoginGoogle
//
//  Created by Paul Jaime Felix Flores on 29/07/24.
//

import SwiftUI
import GoogleSignIn

struct HomeView: View {
    //Vid 302, metodos de nuestra clase
    @EnvironmentObject var viewModel : AuthViewModel
    //Vid 302,traer los datos del usuario
    let user = GIDSignIn.sharedInstance.currentUser
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                //Vid 302,traemos la imagen del usuario 
                AsyncImage(url: user?.profile?.imageURL(withDimension: 200))
                
                Text(user?.profile?.name ?? "")
                    .font(.headline)
                
                Text(user?.profile?.email ?? "")
                    .font(.subheadline)
                Spacer()
                
                Button {
                    viewModel.signOut()
                } label: {
                    Text("Salir")
                }.buttonStyle(.bordered)
                    .tint(.red)

                
                
            }.navigationTitle("Home")
                .padding(.all)
        }
    }
}

#Preview {
    HomeView()
}
