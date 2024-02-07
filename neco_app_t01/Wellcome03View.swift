import SwiftUI

struct ClimateView: View {
    var body: some View {
        VStack {
            Spacer() // Cria espaço no topo
            
            Image("neco_image") // Substitua com o nome da imagem do logo no Asset Catalog
                .resizable()
                .scaledToFit()
                .frame(height: 120) // Ajuste conforme necessário
            
            Image("wellcome_image_03") // Substitua com o nome da ilustração no Asset Catalog
                .resizable()
                .scaledToFit()
                .frame(height: 300) // Ajuste conforme necessário
            
//            Text("Climate for your vegetable garden")
//                .font(.title)
//                .fontWeight(.semibold)
//                .padding(.horizontal)
//                .multilineTextAlignment(.center)
            
            // Título com quebra de linha
            VStack(alignment: .leading, spacing: 0) {
                Text("Climate for your vegetable")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(Color("Green"))
                    
                    

                Text("garden")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(Color("Green"))
                    .padding(.leading,120)
                    
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal)
            
            Text("Our service offers care alerts for your garden and requires access to your current location.")
                .font(.body)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
            
            Spacer()
            Spacer()

            
            Button(action: {
                // Ação para permitir acesso à localização
            }) {

                NavigationLink(destination: VegetableGardenView()) {
                    Text("Allow location access")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("Green"))
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .padding(.horizontal)
                }
            }
            
            Button(action: {
            }) {
                
                    Text("Maybe later")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(Color("Green"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("Green"), lineWidth: 2)
                        )
                        .padding(.horizontal)
                
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ClimateView_Previews: PreviewProvider {
    static var previews: some View {
        ClimateView()
    }
}
