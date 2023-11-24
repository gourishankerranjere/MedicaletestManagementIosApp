//
//  SuccessView.swift
//  LabratoryManagementSystem
//
//  Created by Gourishanker on 23/11/23.
//

import SwiftUI

struct SuccessView: View {
    @Binding var isPresented: Bool // Binding to dismiss the sheet
    @State private var redirectToLogin = false // State variable to trigger navigation
    @State private var goToNextScreen = false
        
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Registration Successful!")
                    .font(.title)
                    .foregroundColor(.green)
                    .navigationBarBackButtonHidden(true)
                
            
                Button(action: {
                                    goToNextScreen = true
                                }) {
                                    Text("SignIn")
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color.blue)
                                        .cornerRadius(8)
                                }.padding()
                
                            NavigationLink(
                                destination: LoginScreen().navigationBarBackButtonHidden(true).ignoresSafeArea(.all,edges: .all
                                                                                                        ),
                                    isActive: $goToNextScreen,
                                    label: { EmptyView() }
                )
                           
            }
            .padding()
        }
    }
    
//    private func dismiss() {
//        isPresented = false // Dismisses the sheet when "Back" button is tapped
//        
//            
//        
//    }
}


