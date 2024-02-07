import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView { // Envolve o conteúdo em um NavigationView
            VStack {
                Spacer()
                
                Image("neco_image")
                
                Text("Welcome!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 20)
                    .foregroundColor(Color("Green"))
                
                Text("With NECO, you can monitor your hydroponic greenhouses simply and easily.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 5)
                    .foregroundColor(Color("Gray_color"))
                
                Spacer()
                
                // NavigationLink para navegar para a próxima tela
                NavigationLink(destination: Wellcome02View()) {
                    Text("START")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("Green"))
                        .cornerRadius(10)
                        .padding(.horizontal, 50)
                }
                .padding(.bottom, 50)
            }
            .padding()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
