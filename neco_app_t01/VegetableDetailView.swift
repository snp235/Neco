//import SwiftUI
//
//struct VegetableDetailView: View {
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 10) {
//                
////                Image("Lettuce_infos")
//                
//                // Cabeçalho com o nome da hortaliça e a categoria
//                HStack {
//                    VStack(alignment: .leading) {
//                        Text("Lettuce")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                        
//                        Text("Leafy vegetable")
//                            .font(.headline)
//                            .foregroundColor(.secondary)
//                    }
//                    Spacer()
//                }
//                .padding(.horizontal)
//
//                // Descrição da hortaliça
//                Text("Lettuce is a vegetable rich in vitamin C, vitamin A, vitamin K and lycopene, which is a powerful antioxidant, helping to maintain skin health, strengthen the immune system and prevent cardiovascular diseases, such as heart attack and atherosclerosis.")
//                    .padding(.horizontal)
//
//                // Temperatura e umidade
//                HStack {
//                    InfoBoxView1(label: "Temperature", value: "30°C", systemImage: "thermometer")
//                    InfoBoxView2(label: "Moisture", value: "60%", systemImage: "drop.fill")
//                }
//                .padding(.horizontal)
//                
//                Spacer()
//                
//                HStack{
//                    // Outras informações relevantes
//                    InfoRowView(label: "Optimal brightness", value: "Direct light")
//                    InfoRowView(label: "Type of fertilizer", value: "Organomineral")
//                }
//                
//                
//                
//                HStack{
//                    InfoRowView(label: "Watering Frequency", value: "Every day")
//                    InfoRowView(label: "Fertilization Frequency", value: "1 time a week")
//                }
//                
//                Spacer()
//                // Localização e próxima fertilização
//                LocationInfoView()
//                FertilizationInfoView()
//
//                // Botões de editar e deletar
//                VStack {
//                    Button(action: {
//                        // Ação para editar informações
//                    }) {
//                        HStack {
//                            Image(systemName: "pencil")
//                            Text("Edit information")
//                        }
//                    }
//                    .buttonStyle(FilledButtonStyle())
//                    
//                    Button(action: {
//                        // Ação para deletar da horta
//                    }) {
//                        HStack {
//                            Image(systemName: "trash")
//                            Text("Delete from my garden")
//                        }
//                    }
//                    .buttonStyle(FilledButtonStyle(backgroundColor: Color.red))
//                }
//                .padding(.horizontal)
//            }
//        }
//    }
//}
//
//// Componentes de UI auxiliares
//struct InfoBoxView1: View {
//    let label: String
//    let value: String
//    let systemImage: String
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Image(systemName: systemImage)
//                Text(value)
//                    .font(.headline)
//            }
//            .padding()
//            .background(Color("temperature_color"))
//            .cornerRadius(10)
//            
//            Text(label)
//                .font(.caption)
//                .foregroundColor(.secondary)
//        }
//    }
//}
//
//struct InfoBoxView2: View {
//    let label: String
//    let value: String
//    let systemImage: String
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Image(systemName: systemImage)
//                Text(value)
//                    .font(.headline)
//            }
//            .padding()
//            .background(Color("Moisture_color"))
//            .cornerRadius(10)
//            
//            Text(label)
//                .font(.caption)
//                .foregroundColor(.secondary)
//        }
//    }
//}
//
//struct InfoRowView: View {
//    let label: String
//    let value: String
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(label)
//                .font(.caption)
//                .foregroundColor(.secondary)
//            Text(value)
//                .font(.headline)
//        }
//        .padding()
//        .frame(maxWidth: .infinity)
//        .background(Color.gray.opacity(0.1))
//        .cornerRadius(10)
//        .padding(.horizontal, 9)
//    }
//}
//
//struct LocationInfoView: View {
//    var body: some View {
//        VStack(alignment: .leading) {
//            HStack {
//                Image("location_image")
//                // .padding(.leading, 1)
//                VStack {
//                    Text("Location")
//                        .font(.title2)
//                        .fontWeight(.semibold)
//                        .padding(.top, 15)
//                        .padding(.trailing, 120)
//                    
//                    Text("It is located in module 01")
//                        .padding(.bottom)
//                        .fontWeight(.regular)
//                        .padding(.leading, 11)
//                        .padding(.trailing, 30)
//                    
//                }
//            }
//            .padding()
//            .background(Color("location_green"))
//            .cornerRadius(10)
//            .gridColumnAlignment(.center)
//        }
//        .padding(.leading, 30)
//    }
//}
//
//struct FertilizationInfoView: View {
//    var body: some View {
//        VStack(alignment: .leading) {
//            HStack {
//                Image("Fertilization_image")
//                // .padding(.leading, 1)
//                VStack {
//                    Text("Next Fertilization:")
//                        .font(.title3)
//                        .fontWeight(.semibold)
//                        .padding(.top, 15)
//                        .padding(.trailing, 50)
//                        .padding(.leading, 30)
//                    
//                   // Spacer()
//                    
//                    Text("15/11")
//                        .padding(.bottom)
//                        .fontWeight(.regular)
//                        .padding(.leading, -90)
//                    
//                }
//            }
//            .padding()
//            .background(Color("Fertilization_color"))
//            .cornerRadius(10)
//        }
//        .padding(.leading, 30)
//    }
//}
//
//struct FilledButtonStyle: ButtonStyle {
//    var backgroundColor: Color = Color.green
//    
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding()
//            .background(backgroundColor)
//            .foregroundColor(.white)
//            .cornerRadius(10)
//            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
//            .padding(.horizontal, 60)
//    }
//}
//
//struct VegetableDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        VegetableDetailView()
//    }
//}
