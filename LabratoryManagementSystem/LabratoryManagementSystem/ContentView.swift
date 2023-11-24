import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var registrationSuccess = false
    
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .padding()
            
            TextField("Name", text: $name)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: saveUser) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
                
                    .navigationBarBackButtonHidden(true)
            }
            .padding()
        }
        .padding()
        .navigationTitle("Sign Up")
        .sheet(isPresented: $registrationSuccess) {
            SuccessView(isPresented: $registrationSuccess).ignoresSafeArea(.all,edges: .all).navigationBarBackButtonHidden(true)
                    }
        
       
    }
    
    private func saveUser() {
        guard password == confirmPassword else {
            // Show an alert or handle password mismatch
            return
        }
        print(NSHomeDirectory())
        registrationSuccess = true
        
        let newUser = User(context: viewContext)
        
        newUser.name = name
        newUser.email = email
        newUser.password = password
        print(newUser.name!)
        
        do {
            try viewContext.save()
            // Optionally, show a success message or navigate to another view
        } catch {
            // Show an error message
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
