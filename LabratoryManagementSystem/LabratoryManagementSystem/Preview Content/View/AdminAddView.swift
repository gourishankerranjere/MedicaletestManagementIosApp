//
//  AdminAddView.swift
//  LabratoryManagementSystem
//
//  Created by Gourishanker on 23/11/23.
//

import SwiftUI

import SwiftUI
 
struct AdminPage: View {
    
    @State var textFieldText : String  = ""
        @State var selection1: String = ""
    @State var selection2: String = ""
    @State var selection3: String = ""
        let filterOptions1 : [String] = ["Blood", "Urine", "Lipid"]
    let filterOptions2 : [String] = ["Clinical Biochemistry", "Viology", "Microbiology"]
    let filterOptions3 : [String] = ["Pathology", "Radiology"]
    
    init()
    {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.purple
        let attributes :[NSAttributedString.Key:Any] = [.foregroundColor : UIColor.white ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes , for: .selected)
    }
        
        var body: some View {
           
            VStack {
                Spacer()
                HStack{
                    Text("Name:")
                    TextField("Enter Your Name", text: $textFieldText)
                        .padding()
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.headline)
                }
               Divider()
                Spacer(minLength:50)
            
               Text("Sample Type")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing,200)
                    
                    
                Picker(selection: $selection1, content: {
   
                    
                    
                    ForEach(filterOptions1, id: \.self){
                        option in
                        HStack{
                            Text("\(option)")
                        }
                        .tag("\(option)")
                    }
             
                }, label:{Text("Picker")}
                )
                .pickerStyle(SegmentedPickerStyle())
                    .background(Color.gray.opacity(0.3))
                
                HStack{
                    Text("Selected Sample Type:")
                    Text(selection1).foregroundColor(.black)
                        .fontWeight(.bold)
                    
                }
                
                Divider()
                Spacer(minLength:50)
                
                Text("Department")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing,200)
                     
                 Picker(selection: $selection2, content: {
    
                     
                     
                     ForEach(filterOptions2, id: \.self){
                         option in
                         HStack{
                             Text("\(option)")
                         }
                         .tag("\(option)")
                     }
              
                 }, label:{Text("Picker")}
                 )
                 .pickerStyle(SegmentedPickerStyle())
                     .background(Color.gray.opacity(0.3))
                 
                 HStack{
                     Text("Selected Department:")
                     Text(selection2).foregroundColor(.black)
                         .fontWeight(.bold)
                     
                 }
                Divider()
                Spacer(minLength:50)
                Text("Test Type")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing,230.0)
                     
                 Picker(selection: $selection3, content: {
    
                     
                     
                     ForEach(filterOptions3, id: \.self){
                         option in
                         HStack{
                             Text("\(option)")
                         }
                         .tag("\(option)")
                     }
              
                 }, label:{Text("Picker")}
                 )
                 .pickerStyle(SegmentedPickerStyle())
                     .background(Color.gray.opacity(0.3))
                 
                 HStack{
                     Text("Selected Test Type:")
                     Text(selection3).foregroundColor(.black)
                         .fontWeight(.bold)
                     
                 }
                     Divider()
                Spacer(minLength:50)
                
                Button(action:{ }, label:{ Text("Add".uppercased())
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding(20)
                        .padding(.horizontal,20)
                        .background(Color.blue .cornerRadius(10)
                            .shadow(radius: 10))
                    }
                        )
                
                    
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(
                LinearGradient(gradient:Gradient(colors: [Color.blue,Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
        }
    }

