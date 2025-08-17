import SwiftUI

struct IntroductionView: View {
    var body: some View {
        // Sử dụng ZStack để thêm background
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    // Card 1: Lịch sử Bóng rổ
                    NavigationLink(destination: HistoryView()) {
                        IntroCardView(
                            title: "Lịch sử Bóng rổ",
                            icon: "hourglass",
                            description: "Tìm hiểu nguồn gốc và sự phát triển của môn thể thao này.",
                            startColor: Color.blue,
                            endColor: Color.cyan
                        )
                    }

                    // Card 2: Luật đơn giản
                    NavigationLink(destination: RulesView()) {
                        IntroCardView(
                            title: "Luật đơn giản",
                            icon: "doc.text",
                            description: "Nắm vững những quy tắc cơ bản để bắt đầu chơi bóng rổ.",
                            startColor: Color.orange,
                            endColor: Color.yellow
                        )
                    }

                    // Card 3: Các chuẩn bị cần có
                    NavigationLink(destination: PreparationView()) {
                        IntroCardView(
                            title: "Các chuẩn bị cần có",
                            icon: "bag.fill",
                            description: "Từ giày đến bóng, biết những gì bạn cần trước khi ra sân.",
                            startColor: Color.purple,
                            endColor: Color.pink
                        )
                    }

                    // Card 4: Lợi ích sức khỏe
                    NavigationLink(destination: BenefitsView()) {
                        IntroCardView(
                            title: "Lợi ích sức khỏe",
                            icon: "heart.fill",
                            description: "Khám phá những tác động tích cực của bóng rổ lên cơ thể.",
                            startColor: Color.green,
                            endColor: Color.mint
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("Giới Thiệu")
        }
    }
}

// Custom View cho từng card để tái sử dụng
struct IntroCardView: View {
    let title: String
    let icon: String
    let description: String
    let startColor: Color
    let endColor: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
            Text(description)
                .font(.body)
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [startColor, endColor]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
        .shadow(color: startColor.opacity(0.4), radius: 10, x: 0, y: 5)
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            IntroductionView()
        }
    }
}

