import SwiftUI

struct CookbookView: View {
    // nome e uma imagem associada.
    let categories = [
        ("Fitness Recipes", "fitness_image"),
        ("Snacks", "snacks_image"),
        ("Desserts", "desserts_image"),
        ("Vegan Recipes", "vegan_Image"),
        ("School Snacks", "school_snacks_image"),
        ("Juices", "juices_Image"),
        ("Pizzas", "pizzas_image"),
        ("Frozen Foods", "frozen_food_image"),
        ("Soups", "soups_image"),
        ("Salads", "salads_image")
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(categories, id: \.0) { category in
                        Button(action: {
                            print("\(category.0) was tapped.")
                        }) {
                            VStack {
                                Image(category.1)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height:70)
                                    .frame(width: 150)
                                    .clipped()
                                Text(category.0)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Cookbook")
        }
    }
}

struct CookbookView_Previews: PreviewProvider {
    static var previews: some View {
        CookbookView()
    }
}

