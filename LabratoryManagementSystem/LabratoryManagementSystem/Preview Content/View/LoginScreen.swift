//
//  LoginScreen.swift
//  LabratoryManagementSystem
//
//  Created by Gourishanker on 23/11/23.
//

import SwiftUI
 
struct LoginScreen: View {
    
    @State var backgroundColor : Color = Color.white
    @State private var username = ""
    @State private var password = ""
    @State var selection1: String = ""
    
    let filterOptions1 : [String] = ["USER", "ADMIN"]
    init()
    {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.purple
        let attributes :[NSAttributedString.Key:Any] = [.foregroundColor : UIColor.white ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes , for: .selected)
    }
    var body: some View {
        NavigationView
        {
            ZStack
            {
                backgroundColor
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                VStack
                {
                    Spacer(minLength:100)
                    
                    Text("LAB MANAGEMENT SYSTEM")
                        .font(.title)
                        .multilineTextAlignment(.leading)
                    Spacer(minLength:100)
                    
                    
                    
                    Picker(selection: $selection1, content: {
                        
                        
                        
                        ForEach(filterOptions1, id: \.self){
                            option in
                            HStack{
                                Text("\(option)")
                                    .bold()
                            }
                            .tag("\(option)")
                        }
                        
                    }, label:{Text("Picker")}
                    )
                    .pickerStyle(SegmentedPickerStyle())
                    .background(Color.gray.opacity(0.3))
                    
                    HStack{
                        Text("You will be login as :")
                        Text(selection1).foregroundColor(.black)
                            .fontWeight(.bold)
                        
                    }
                    Spacer(minLength:30)
                    TextField("Username", text: $username)
                    
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Spacer(minLength:10)
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Spacer(minLength:30)
                   HStack
                    { NavigationLink(destination: AdminPage())
                        {
                            Text("Login")
                                .frame(width: 100,height: 50,alignment: .center)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(50)
                        }
                        NavigationLink(destination: ContentView())
                        {
                            Text("SignUp")
                                .frame(width: 100,height: 50,alignment: .center)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(50)
                            
                        }
                    }
                    
//                    HStack
//                    {
//                        Button(action:{  NavigationLink(destination: ContentView())
//                            {
//                                Text("SignUp")
//                                
//                            } }, label:{ Text("Sign in".uppercased())
//                                .font(.headline)
//                                .fontWeight(.semibold)
//                                .foregroundColor(Color.white)
//                                .padding(20)
//                                .padding(.horizontal,20)
//                                .background(Color.blue .cornerRadius(10)
//                                    .shadow(radius: 10)
//                                )
//                        }
//                        )
//                        NavigationLink(destination:ContentView()){ Button(action:{LoginScreen()}, label:{ Text("Signup / NewUser".uppercased())
//                                .font(.headline)
//                                .fontWeight(.semibold)
//                                .foregroundColor(Color.white)
//                                .padding(20)
//                                .padding(.horizontal,20)
//                                .background(Color.blue .cornerRadius(10)
//                                    .shadow(radius: 10)
//                                )
//                        }
//                        )}
                       
                        
                    }
                    Spacer(minLength:200)
                }
            }
            
            
            
        
    }

}

#Preview {
    LoginScreen()
}


