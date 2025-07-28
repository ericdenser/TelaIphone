import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SuporteView()
                .tabItem {
                    Image(systemName: "questionmark.circle.fill")
                    Text("Suporte")
                }
            
            Text("Locais")
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Locais")
                }
            
            Text("Atividade")
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("Atividade")
                }
        }
    }
}

struct SuporteView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray6).ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        // Botao de voltar
                        HStack {
                            Button(action: {
                                // acao de voltar
                            }) {
                                HStack(spacing: 4) {
                                    Image(systemName: "chevron.left")
                                    Text("Suporte")
                                }
                                .foregroundColor(.blue)
                                .font(.system(size: 17))
                            }
                            Spacer()
                        }
                        .padding(.top, 16)
                        .padding(.horizontal)
                        
                        // Imagem iphone e título
                        VStack(spacing: 4) {
                            Image("phoneEric")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 22))
                                .padding(.bottom, 15)
                                .padding(.top, 10)
                            
                            Text("iPhone de Eric")
                                .font(.system(size: 20, weight: .semibold))
                            
                            Text("Este iPhone 11")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            
                            Button {
                                // acao de mostrar detalhes
                            } label: {
                                Text("Mostrar detalhes")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.blue)
                            }
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 10)
                        
                        // Campo de busca
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Tópicos de suporte")
                                .font(.system(size: 20, weight: .semibold))
                                
                                .padding(.top, 10)
                                .padding(.horizontal)
                                .padding(.bottom, 10)
                            
                            SuporteInputField()

                        }
                        
                        // Caixa de topicos
                        VStack(spacing: 0) {
                            TopicRow(emoji: "🛠️", title: "Reparos e danos físicos")
                            Divider()
                            TopicRow(emoji: "📉", title: "Desempenho do dispositivo")
                            Divider()
                            TopicRow(emoji: "💳", title: "Assinaturas e compras")
                            Divider()
                            TopicRow(emoji: "🛍️", title: "Compras na Apple Store")
                            Divider()
                            TopicRow(emoji: "🔒", title: "Senhas e segurança")
                            Divider()
                            TopicRow(emoji: "🟢", title: "Atualização, backup e restauração")
                            Divider()
                            TopicRow(emoji: "⚪", title: "Mais")
                        }
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 1)
                        .padding(.horizontal)
                        .padding(.bottom, 32)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct SuporteInputField: View {
    @State private var texto: String = ""
    var body: some View {
        HStack {
            TextField("Conte o que está acontecendo", text: $texto)
                .font(.system(size: 15))
            Spacer()
            Image(systemName: "mic.fill")
                .foregroundStyle(.gray)
        }
 
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

// Construtor de cada topico
struct TopicRow: View {
    let emoji: String
    let title: String
    
    var body: some View {
        HStack {
            Text(emoji)
                .font(.system(size: 22))
            Text(title)
                .font(.system(size: 17))
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(Color.white)
    }
}

#Preview {
    ContentView()
}
