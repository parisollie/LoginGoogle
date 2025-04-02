//
//  HomeView.swift
//  LoginGoogle
//
//  Created by Paul Jaime Felix Flores on 29/07/24.
//

import SwiftUI
import GoogleSignIn

struct HomeView: View {
    // Vid 302, metodos de nuestra clase
    @EnvironmentObject var viewModel: AuthViewModel
    
    // Vid 302, traer los datos del usuario
    let user = GIDSignIn.sharedInstance.currentUser
    
    var body: some View {
        NavigationView {
            VStack {
                if let profile = user?.profile {
                    VStack(spacing: 16) {
                        // Vid 302, traemos la imagen del usuario con diseño mejorado
                        AsyncImage(url: profile.imageURL(withDimension: 200)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .clipShape(Circle()) // Hace la imagen redonda
                                .shadow(radius: 5)
                        } placeholder: {
                            ProgressView()
                        }

                        // Vid 302, mostrar nombre y correo con mejor diseño
                        Text(profile.name)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(profile.email)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 20)
                } else {
                    // Vid 302, mensaje en caso de error al cargar el usuario
                    Text("No se pudo cargar la información del usuario")
                        .foregroundColor(.red)
                        .padding()
                }
                
                Spacer()
                
                // Vid 302, botón de cerrar sesión con diseño mejorado
                Button(action: {
                    viewModel.signOut()
                }) {
                    Label("Cerrar sesión", systemImage: "arrow.right.circle.fill")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 2)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 30)
            }
            .navigationTitle("Perfil") // Vid 302, titulo de la vista
            .padding()
        }
    }
}


#Preview {
    HomeView()
}
