import SwiftUI

// Definição das estruturas de resposta da API
struct APIResponse: Codable {
    var predictions: [Prediction]
}

struct Prediction: Codable {
    var probability: Double
    var tagId: String
    var tagName: String
    var boundingBox: BoundingBox
}

struct BoundingBox: Codable {
    var left: Double
    var top: Double
    var width: Double
    var height: Double
}

// Estrutura para a visualização da imagem com bounding boxes
struct BoundingBoxesImageView: View {
    var image: UIImage
    var predictions: [Prediction]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(uiImage: self.image)
                    .resizable()
                    .scaledToFit()
                
                // Desenhar bounding boxes
                ForEach(self.predictions, id: \.tagId) { prediction in
                    BoundingBoxView(prediction: prediction, imageSize: self.image.size, geometrySize: geometry.size)
                }
            }
        }
    }
}

// Estrutura para a visualização de uma bounding box específica
struct BoundingBoxView: View {
    var prediction: Prediction
    var imageSize: CGSize
    var geometrySize: CGSize

    var body: some View {
        let frameSize = CGSize(width: imageSize.width * CGFloat(prediction.boundingBox.width), height: imageSize.height * CGFloat(prediction.boundingBox.height))
        let frameOrigin = CGPoint(x: imageSize.width * CGFloat(prediction.boundingBox.left), y: imageSize.height * CGFloat(prediction.boundingBox.top))
        let scale = min(geometrySize.width / imageSize.width, geometrySize.height / imageSize.height)
        let offset = CGSize(width: (geometrySize.width - imageSize.width * scale) / 2, height: (geometrySize.height - imageSize.height * scale) / 2)

        return Rectangle()
            .path(in: CGRect(x: (frameOrigin.x * scale) + offset.width, y: (frameOrigin.y * scale) + offset.height, width: frameSize.width * scale, height: frameSize.height * scale))
            .stroke(lineWidth: 2)
            .foregroundColor(.red)
//            .overlay(Text("\(prediction.tagName) \(Int(prediction.probability * 100))%").offset(x: (frameOrigin.x * scale) + offset.width, y: (frameOrigin.y * scale) + offset.height))
    }
}

struct IAView: View {
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var uploadStatus: String = ""
    @State private var predictions: [Prediction] = []
    
    var body: some View {
        VStack {
            if let selectedImage = selectedImage {
                BoundingBoxesImageView(image: selectedImage, predictions: predictions)
                    .frame(height: 300)
            } else {
                Image("photos_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        self.isShowingImagePicker = true
                    }
            }
            
            Button("Submit for review") {
                uploadImage()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text(uploadStatus)
        }
        .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$selectedImage)
        }
    }
    
    func loadImage() {
        // Função para processar a imagem selecionada se necessário
    }
    
    func uploadImage() {
        guard let selectedImage = selectedImage,
              let imageData = selectedImage.jpegData(compressionQuality: 0.8) else {
            self.uploadStatus = "Image not available"
            return
        }

        // Configuração da URL e da Request com os novos detalhes da API
        let url = URL(string: "https://cropmonitoring-prediction.cognitiveservices.azure.com/customvision/v3.0/Prediction/c747774c-248a-4c10-a26a-3863c37a126d/detect/iterations/Iteration3/image")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/octet-stream", forHTTPHeaderField: "Content-Type")
        request.setValue("1884c9df245f4c269100d19e4fadc26b", forHTTPHeaderField: "Prediction-Key")
        request.httpBody = imageData

        // Realização da Request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.uploadStatus = "Upload failed: \(error.localizedDescription)"
                }
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let data = data else {
                DispatchQueue.main.async {
                    self.uploadStatus = "Upload failed with status: \((response as? HTTPURLResponse)?.statusCode ?? 0)"
                }
                return
            }
            
            
            

//            // Decodificação da resposta da API e atualização da UI
//            do {
//                let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
//                DispatchQueue.main.async {
//                    // Filtrar previsões com probabilidade maior que 0.5 (ou 50%)
//                    let highProbabilityPredictions = apiResponse.predictions.filter { $0.probability > 0.5 }
//
//                    // Atualizar as previsões do estado
//                    self.predictions = highProbabilityPredictions
//
//                    // Preparar e exibir uma mensagem com base nas previsões filtradas
//                    self.uploadStatus = highProbabilityPredictions.isEmpty ? "No anomalies detected with high confidence." : "Anomalies detected with high confidence."
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    self.uploadStatus = "Failed to decode response: \(error.localizedDescription)"
//                }
//            }
            
            do {
                let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                print("API Response: \(apiResponse)") // Imprime a resposta bruta da API
                DispatchQueue.main.async {
                    // Filtrar previsões com probabilidade maior que 0.5 (ou 50%)
                    let highProbabilityPredictions = apiResponse.predictions.filter { $0.probability > 0.01 }

                   // print("Filtered Predictions: \(highProbabilityPredictions)") // Imprime as previsões filtradas
                    
                    // Atualizar as previsões do estado
                    self.predictions = highProbabilityPredictions
                    
                    // Se necessário, atualize a mensagem de status
                    self.uploadStatus = highProbabilityPredictions.isEmpty ? "No anomalies detected with high confidence." : "An anomaly was detected. Ask NecoGPT for more information about it."
                }
            } catch {
                DispatchQueue.main.async {
                    self.uploadStatus = "Failed to decode response: \(error.localizedDescription)"
                    print("Decoding Error: \(error)") // Imprime o erro de decodificação
                }
            }

            
            
            
            
            
        }
        task.resume()
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        // Não é necessário atualizar nada aqui
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct IAView_Previews: PreviewProvider {
    static var previews: some View {
        IAView()
    }
}
