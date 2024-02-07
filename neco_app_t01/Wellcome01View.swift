import SwiftUI

struct Wellcome01View: View {
    var body: some View {
        VStack {
            Image("neco_image")
                .resizable()
                .scaledToFit()
                .frame(height: 100)

            Spacer()
            

//            Image("wellcome_image_01")
//                .resizable()
//                .scaledToFit()
//                .frame(height: 300)
            
            Image("hydroponics_image")
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                
            
            

            // Título com quebra de linha
            VStack(alignment: .leading, spacing: 0) {
                Text("Monitor your modules")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(Color("Green"))
                    

//                Text("garden")
//                    .font(.title)
//                    .fontWeight(.regular)
//                    .foregroundColor(Color("Green"))
//                    .padding(.leading, 100)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal)
            .padding(.bottom,12)
            
            

            Text("If you have more than one NECO module, get an overview of their development.")
                .font(.subheadline)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
           

            // Botão "Maybe later" com NavigationLink
            NavigationLink(destination: Tab()) {
                Text("Next →")
                    .fontWeight(.medium)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 40)
                    .foregroundColor(Color("Green"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("Green"), lineWidth: 1)
                    )
                    .frame(width: 691, height: 111)
            }
            
//            Button(action: {
//                // Ação para o botão "Jump to Home Screen"
//            }) {
//                Text("Jump to Home Screen")
//                    .foregroundColor(Color.gray)
//            }

            Spacer()
        }
        .padding()
    }
}

struct Wellcome01View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
                   Wellcome01View()
               }
    }
}
