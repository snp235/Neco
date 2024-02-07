import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // Substitua este URL pelo URL do seu vídeo
    let videoURL = URL(string: "https://www.example.com/video.mp4")!

    var body: some View {
        VStack {
            Text("Introduction to hydroponic gardens")
                .font(.title)
                .fontWeight(.semibold)
                .padding()

            // Substitua este Rectangle por um VideoPlayer se você tiver o URL do vídeo
            Rectangle()
                .foregroundColor(.gray)
                .aspectRatio(16/9, contentMode: .fit)
                .overlay(
                    Button(action: {
                        // Ação para tocar o vídeo
                    }) {
                        Image(systemName: "play.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                )

            Text("""
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in dolor est. Morbi aliquet est a venenatis porttitor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae.
                """)
                .padding()
            
            Spacer()
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
