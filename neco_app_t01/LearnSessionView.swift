import SwiftUI

struct LearnView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                    // Courses and tutorials button with NavigationLink
                    NavigationLink(destination: StudyView()) {
                        HStack(alignment: .center) {
                            Rectangle()
                                .fill(Color("green_learn"))
                                .frame(width: 9)
                            
                            Image("study_icon")
                                .padding(.leading, 10)
                            
                            VStack {
                                Text("Courses and tutorials")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                    .padding(.leading, 5)
                                
                                Text("Study session")
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                    .padding(.leading, -55)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .frame(height: 100)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                    }
                    Spacer()
                    
                    // Outros botões e conteúdos podem permanecer inalterados.
                    // Adicione seus outros componentes aqui
                    
                    NavigationLink(destination: CookbookView()){
                        HStack(alignment: .center) {
                            Rectangle()
                                .fill(Color("red_learn"))
                                .frame(width: 9)
                            
                            Image("cookbook_image")
                                .padding(.leading, 10)
                            
                            VStack{
                                Text("Recipes and tips")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                    .padding(.leading, 5)
                                
                                Text("Cook session")
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                    .padding(.leading, -17)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .frame(height: 100)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                    
                        
                    }
                    Spacer()
                    
                    Button(action: {
                        // Ação do botão
                    }) {
                        HStack(alignment: .center) {
                            Rectangle()
                                .fill(Color("yellow_color"))
                                .frame(width: 9)
                            
                            Image("games_icon")
                                .padding(.leading, 10)
                            
                            VStack{
                                Text("Games and learn")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                    .padding(.leading, 5)
                                
                                Text("Game session")
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                    .padding(.leading, -17)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .frame(height: 100)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                        
                    }
                    
                    /*Text("Curiosities")
                     .font(.largeTitle)
                     .foregroundColor(Color.black)
                     .font(.custom("Inter", size: 25))
                     .fontWeight(.semibold)
                     .padding(.leading)
                     .padding(.top,20)
                     
                     
                     ZStack {
                     RoundedRectangle(cornerRadius: 12)
                     .fill(Color.white)
                     .shadow(radius: 5)
                     .frame(width: 370, height: 150)
                     
                     
                     HStack(alignment: .top, spacing: 10) {
                     Image("Lettuce_image") // Substitua pelo nome correto da sua imagem
                     .resizable()
                     .scaledToFill()
                     .frame(width: 110, height: 110)
                     .clipped()
                     .cornerRadius(10)
                     .padding(.leading, 22)
                     
                     VStack(alignment: .leading) {
                     Text("Did you know that lettuce...")
                     .font(.title3)
                     .fontWeight(.bold)
                     .padding(.leading,7)
                     
                     Text("It has a low carbohydrate, protein and fat content and is rich in vitamins and minerals.")
                     .font(.body)
                     .foregroundColor(.secondary)
                     .padding(.leading,7)
                     }
                     
                     Spacer()
                     }
                     }*/
                    
                    Button(action: {
                        // Ação do botão
                    }) {
                        NavigationLink(destination: Chat_View01()) {
                            Image("chat_image")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 65, height: 65) // Ajuste para o tamanho desejado do botão
                            
                                .foregroundColor(.white) // Cor do ícone
                        }
                    }
                    .padding(.leading, 300) // Ajuste o padding conforme necessário
                    .padding(.top, 50)
                    
                    .shadow(radius:3) // Adiciona sombra ao botão
                    
                    
                    
                    
                }
                .navigationTitle("Learn session")
                
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
    
    
    struct LearnView_Previews: PreviewProvider {
        static var previews: some View {
            LearnView()
        }
    }
}
