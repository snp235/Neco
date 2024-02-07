import SwiftUI

struct VegetableGardenView: View {
    var body: some View {
        NavigationView{
        ScrollView {
            VStack {
                HStack {
                    Text("My vegetable garden")
                        .font(.largeTitle)
                        .foregroundColor(Color("Green"))
                        .font(.custom("Inter", size: 25))
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: {
                        // Ação para adicionar novo vegetal
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("Green"))
                    }
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        VegetableView(name: "Zucchini", imageName: "zucchini_image")
                        VegetableView(name: "Lettuce", imageName: "Lettuce_image")
                        VegetableView(name: "Potatoes", imageName: "Potato_image")
                    }
                    .padding()
                }
                
                Text("Computer vision")
                    .font(.largeTitle)
                    .foregroundColor(Color("Green"))
                    .font(.custom("Inter", size: 25))
                    .fontWeight(.semibold)
                // .padding(.top, )
                    .padding(.trailing, 110)
                
                NavigationLink {
                    IAView()
                } label : {
                        HStack {
                            
                            Image("garden") // Substitua pelo nome real da sua imagem
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(8)
                            
                            
                            VStack(alignment: .leading) {
                                Text("Is your garden healthy?")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .padding(.leading,5)
                                    .padding(.bottom,12)
                                
                                
                                
                                Text("Check images of your crops to see if there are anomalies")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .lineLimit(3)
                                
                                
                                
                                
                                
                                
                            }
                            Spacer()
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                    }
                    .padding(.horizontal)
                
                Spacer()
                Spacer()
                
                Text("Sticky notes")
                    .font(.largeTitle)
                    .foregroundColor(Color("Green"))
                    .font(.custom("Inter", size: 25))
                    .fontWeight(.semibold)
                    .padding(.trailing, 170)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(red: 250/255, green: 241/255, blue: 241/255))
                        .frame(height: 100)
                    
                    HStack{
                        
                        Image("alert_image")
                        // .padding(.leading, 1)
                        VStack {
                            Text("Module 02 needs repairs!")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.top, 15)
                                .padding(.leading, 7)
                            Text("The module needs maintenance.")
                                .padding(.bottom)
                                .fontWeight(.regular)
                                .padding(.leading, 7)

                        }
                    }
                    
                }
                .padding() // Adicione o espaçamento desejado
                
//                Text("Brightness level")
//                    .font(.largeTitle)
//                    .foregroundColor(Color("Green"))
//                    .font(.custom("Inter", size: 25))
//                    .fontWeight(.semibold)
//                    .padding(.trailing, 110)
                
//                Image("Graphic_image")
                
                
                }
                
                
                
            }
            //.padding(.top, -)
            
            
        }
    }

    struct VegetableView: View {
        var name: String
        var imageName: String // Nome da imagem no seu Asset Catalog
        
        var body: some View {
            
            Button(action: {
                // Ação do botão
            }) {
                VStack {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                        .padding(.top,-30)
                    
                    Text(name)
                        .font(.caption)
                        .foregroundColor(Color("Gray_color"))
                }
                .frame(width: 120, height: 140)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
        }
    }
}

struct VegetableGardenView_Previews: PreviewProvider {
    static var previews: some View {
        VegetableGardenView()
    }
}
