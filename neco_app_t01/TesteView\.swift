//
//struct CView: View {
//    var body: some View {
//        NavigationView {
//            VStack {
//                NavigationLink(destination: DetailView()) {
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text("Sua horta é saudável?")
//                                .font(.headline)
//                                .foregroundColor(.black)
//                            Text("Você sabia que ter uma horta saudável depende de diversos fatores, e que...")
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                        }
//                        Spacer()
//                        Image(systemName: "arrow.right.circle.fill")
//                            .foregroundColor(.blue)
//                    }
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(10)
//                    .shadow(radius: 5)
//                    .padding(.horizontal)
//                }
//            }
//        }
//    }
//}
//
//struct DetailView: View {
//    var body: some View {
//        Text("Detalhes da horta")
//    }
//}
//
//// Aqui está o seu PreviewProvider
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CView()
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
//struct DestinoView: View {
//    var body: some View {
//        Text("Tela Destino")
//            .navigationBarBackButtonHidden(true)
//    }
//}
//
//struct OrigemView: View {
//    var body: some View {
//        NavigationView {
//            NavigationLink(destination: DestinoView()) {
//                Text("Ir para a tela destino")
//            }
//        }
//    }
//}
