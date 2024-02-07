import SwiftUI

// Modelo para os itens da lista
struct Vegetable: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let category: String
    let imageName: String // Nome da imagem no Assets.xcassets
}

// Tela de detalhes para cada vegetal
struct VegetableDetailScreen: View {
    var vegetable: Vegetable

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(vegetable.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(12)

                Text(vegetable.name)
                    .font(.title)
                    .fontWeight(.bold)

                Text(vegetable.description)
                    .font(.body)
                    .padding(.top, 4)

                Spacer()
            }
            .padding()
            .navigationBarTitle(vegetable.name, displayMode: .inline)
        }
    }
}

// Componente de visualização para cada linha da lista
struct VegetableRow: View {
    var vegetable: Vegetable

    var body: some View {
        NavigationLink(destination: VegetableDetailScreen(vegetable: vegetable)) {
            HStack {
                Image(vegetable.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text(vegetable.name)
                        .font(.headline)
                    Text(vegetable.description)
                        .font(.subheadline)
                        .lineLimit(2)
                    Text(vegetable.category)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 8)
            }
            .padding(.vertical, 4)
        }
        .buttonStyle(PlainButtonStyle()) // Para manter o estilo visual do SwiftUI
    }
}

// Tela de busca principal
struct Search: View {
    let vegetables: [Vegetable] = [
        Vegetable(name: "Tomato", description: "Tomato is a fruit rich in vitamin C, vitamin A, vitamin K and lycopene...", category: "Vegetables", imageName: "tomate"),
        Vegetable(name: "Zucchini", description: "Zucchini is a vegetable rich in minerals and vitamins...", category: "Vegetables", imageName: "abobrinha"),
        Vegetable(name: "Potato", description: "Potatoes are one of the most consumed vegetables in South America and...", category: "Vegetables", imageName: "batata"),
        Vegetable(name: "Dedo de Moça", description: "Dedo-de-moça is a pepper with low to medium heat, with...", category: "Pepper", imageName: "dedodemoca")
    ]
    
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List(vegetables) { vegetable in
                VegetableRow(vegetable: vegetable)
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

// Previews
struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
