import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
}

class ChatService {
    private let endpoint = "https://api.openai.com/v1/chat/completions"
    private let apiKey = "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"  // Substitua com a sua chave API real

    static let shared = ChatService()

    func sendMessage(_ message: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: endpoint) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let payload: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": [
                ["role": "user", "content": message]
            ],
            "temperature": 0.7
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: payload, options: [])

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                print("Código de status HTTP: \(httpResponse.statusCode)")
            }

            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.requestFailed))
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let dictionary = json as? [String: Any],
                   let choices = dictionary["choices"] as? [[String: Any]],
                   let firstChoice = choices.first,
                   let message = firstChoice["message"] as? [String: Any],
                   let content = message["content"] as? String {
                    completion(.success(content.trimmingCharacters(in: .whitespacesAndNewlines)))
                } else {
                    completion(.failure(NetworkError.requestFailed))
                }
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
