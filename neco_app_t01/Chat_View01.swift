import SwiftUI

struct Chat_View01: View {
    @State private var userInput: String = ""
    @State private var messages: [String] = []

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(messages, id: \.self) { message in
                        HStack(alignment: .top) {
                            if message.starts(with: "You:") {
                                Spacer()
                                Text(message)
                                    .padding()
                                    .background(Color.green.opacity(0.1))
                                    .cornerRadius(10)
                                    .frame(maxWidth: 300, alignment: .trailing)
                            } else {
                                Text(message)
                                    .padding()
                                    .background(Color.blue.opacity(0.1))
                                    .cornerRadius(10)
                                    .frame(maxWidth: 300, alignment: .leading)
                                Spacer()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)

                HStack {
                    TextField("Send your mensage...", text: $userInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading)

                    Button(action: sendMessage) {
                        Image(systemName: "arrow.right.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                            .foregroundColor(.green)
                    }
                    .padding(.trailing)
                }
            }
            .navigationBarTitle("Neco GPT", displayMode: .inline)
        }
    }

    func sendMessage() {
        guard !userInput.isEmpty else { return }
        let messageToSend = userInput
        userInput = ""

        ChatService.shared.sendMessage(messageToSend) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.messages.append("You: \(messageToSend)")
                    self.messages.append("Neco GPT: \(response)")
                case .failure(let error):
                    self.messages.append("Error sending message: \(error.localizedDescription)")
                }
            }
        }
    }
}

struct Chat_View01_Previews: PreviewProvider {
    static var previews: some View {
        Chat_View01()
    }
}
