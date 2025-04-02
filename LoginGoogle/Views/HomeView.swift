//
//  HomeView.swift
//  LoginGoogle
//
//  Created by Paul Jaime Felix Flores on 29/07/24.
//

import SwiftUI
import GoogleSignIn

struct HomeView: View {
    // V-302,paso 1.13 traemos los métodos de nuestra clase
    @EnvironmentObject var viewModel: AuthViewModel
    
    // traer los datos del usuario nombre y correo
    let user = GIDSignIn.sharedInstance.currentUser
    
    var body: some View {
        NavigationView {
            VStack {
                if let profile = user?.profile {
                    VStack(spacing: 16) {
                        // traemos la imagen del usuario
                        AsyncImage(url: profile.imageURL(withDimension: 200)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        } placeholder: {
                            ProgressView()
                        }

                        // mostrar nombre y correo
                        Text(profile.name)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(profile.email)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 20)
                } else {
                    // mensaje en caso de error al cargar el usuario
                    Text("No se pudo cargar la información del usuario")
                        .foregroundColor(.red)
                        .padding()
                }
                
                Spacer()
                
                // botón de cerrar sesión
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
            // titulo de la vista
            .navigationTitle("Perfil")
            .padding()
        }
    }
}


#Preview {
    HomeView()
}
