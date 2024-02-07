import SwiftUI

struct Wellcome02View: View {
    var body: some View {
        VStack {
            Image("neco_image")
                .resizable()
                .scaledToFit()
                .frame(height: 100)

            Spacer()

//            Image("wellcome_image_02")
//                .resizable()
//                .scaledToFit()
//                .frame(height: 300)
            
            WebView(url: URL(string: "https://cdn.discordapp.com/attachments/1164745207498166345/1204419197401305128/neco_3D_model.gif?ex=65d4a9c9&is=65c234c9&hm=a02018ced81a5a10a1b796b96c2a86ef803da7ebcd365f5da9651ae79dd55991&")!)
                            .frame(height: 300)

            // Título
            VStack(alignment: .leading, spacing: 0) {
                Text("Build your own modules ")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(Color("Green"))
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal)
            .padding(.bottom,12)
            
           

            Text("Assemble your modules and adapt them according to your needs")
                .font(.subheadline)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            // Botão "Maybe later" com NavigationLink
            NavigationLink(destination: Wellcome01View()) {
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

struct Wellcome02View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
                   Wellcome02View()
               }
    }
}
