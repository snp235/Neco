import SwiftUI
import AVKit
import WebKit

struct CourseTabView: View {
    @State private var showNextStepView = false
    @State private var showTheoreticalMaterialView = false

    var body: some View {
        VStack {
            
            Image("nekinho_image") // Substitua pelo nome correto da sua imagem
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding(.top, 40)
            
            Spacer()

            Text("Hello! I am NECO and I will be your guide in the course.")
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()

            Text("Perfect for beginners, it covers the basics of hydroponics, including the science behind growing plants in a nutrient solution. Students will learn about different hydroponic systems, selecting suitable plants, preparing nutrient solutions, and managing environmental conditions to optimize plant growth.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            // Espaçador na parte superior
            Spacer()
            
            // Botão para o Material Teórico
            Button(action: {
                self.showTheoreticalMaterialView = true
            }) {
                Text("Show Theoretical Material")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("Green"))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .sheet(isPresented: $showTheoreticalMaterialView) {
                TheoreticalMaterialView()
            }
            
            // Espaçador entre botões
          //  Spacer(minLength: 20)
            
            // Botão para o Quiz
            Button(action: {
                self.showNextStepView = true
            }) {
                Text("Show Quiz Screen")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("Green"))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .sheet(isPresented: $showNextStepView) {
                NextStepView()
            }
            
            // Espaçador na parte inferior
            Spacer()
        }
    }
}


struct TheoreticalMaterialView: View {
    let videoURL = URL(string: "https://www.youtube.com/watch?v=ethwEJalX-U")!
    
    var body: some View {
        VStack {
                   Text("Theoretical Material")
                       .font(.title)
                       .fontWeight(.semibold)
                   
                   // Espaçador entre o texto do título e o player de vídeo
                   Spacer().frame(height: 20)
                   
                   Text("Introduction to hydroponic gardens")
                       .font(.headline)
                       .padding()

                   // Substitua este Rectangle por um VideoPlayer se você tiver o URL do vídeo
                   Rectangle()
                       .foregroundColor(.gray)
                       .aspectRatio(16/9, contentMode: .fit)
                       .overlay(
                           Button(action: {
                               // Ação para tocar o vídeo
                               //playVideo()
                           }) {
                               Image(systemName: "play.circle.fill")
                                   .font(.largeTitle)
                                   .foregroundColor(.white)
                           }
                       )
                   
                   // Espaçador entre o player de vídeo e o texto de descrição
                   Spacer().frame(height: 20)

                   Text("""
                        Hydroponics is the technique of growing plants using a water-based nutrient solution rather than soil, and can include an aggregate substrate, or growing media, such as vermiculite, coconut coir, or perlite. Hydroponic production systems are used by small farmers, hobbyists, and commercial enterprises...
                       """)
                       .padding()

                   // Restante do seu conteúdo teórico
                   // ...
                   
                   Spacer()
        }
        .padding()
    }
    
//    func playVideo() {
//            // Lógica para tocar o vídeo
//            // Por exemplo, você pode utilizar um player de vídeo ou abrir uma nova view com o player
//        }
}

struct NextStepView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("nekinho_exercise")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("Next step - Quiz")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)
            Text("Now let's see how much you've learned. Ready?")
                .padding()
            Button(action: {
                // Ação para iniciar o quiz
            }) {
                Text("Start the quiz")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Green"))
                    .cornerRadius(40)
            }
            .padding(.horizontal)
            Spacer()
        }
        .padding()
    }
}

struct CourseTabView_Previews: PreviewProvider {
    static var previews: some View {
        CourseTabView()
    }
}
