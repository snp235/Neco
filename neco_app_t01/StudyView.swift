import SwiftUI

struct StudyView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Top status bar simulated for preview purposes (not part of actual UI)
                    
                    Text("Study session")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    CourseCard(title: "Hydroponic vegetable gardens",
                               subtitle: "Introduction to hydroponic gardens")
                    
                    CourseCard(title: "Technology in agriculture",
                               subtitle: "Introduction to technology in agriculture")
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct CourseCard: View {
    var title: String
    var subtitle: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Image("course1_image")
            
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            
            Spacer()
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer().frame(height: 10)
            
            NavigationLink(destination: CourseTabView()) {
                Text("Access course")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Green"))
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        // Add shadow, border, or other styling as needed
        .shadow(radius: 5)
    }
}

// Preview provider for SwiftUI canvas
struct StudyView_Previews: PreviewProvider {
    static var previews: some View {
        StudyView()
    }
}
