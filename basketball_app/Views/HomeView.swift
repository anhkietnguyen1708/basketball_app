import SwiftUI

struct HomeView: View {
    // Định nghĩa bảng màu chủ đạo
    let primaryColor = Color(red: 0.1, green: 0.4, blue: 0.8) // Xanh dương đậm
    let accentColor = Color(red: 1.0, green: 0.5, blue: 0.0) // Cam tươi
    let backgroundColor = Color(red: 0.95, green: 0.95, blue: 0.97) // Xám nhạt

    var body: some View {
        // Sử dụng ZStack để thêm lớp background
        ZStack {
            backgroundColor.ignoresSafeArea()

            VStack(spacing: 30) {
                // Thay đổi cách trình bày logo và text
                Image("basketball_icon") // Đảm bảo có hình ảnh này
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle()) // Tạo hình tròn cho icon
                    .overlay(Circle().stroke(primaryColor, lineWidth: 4))
                    .shadow(radius: 10)
                
                VStack(spacing: 8) {
                    Text("CourtSense")
                        .font(.custom("Arial Rounded MT Bold", size: 40)) // Thay đổi font
                        .fontWeight(.heavy)
                        .foregroundColor(primaryColor)
                    
                    Text("Nơi bạn bắt đầu hành trình bóng rổ của mình.")
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }

                Spacer()
                
                // Sử dụng ForEach để tạo các nút dễ quản lý hơn
                VStack(spacing: 15) {
                    HomeButton(
                        title: "Tìm hiểu về Bóng rổ",
                        iconName: "book.closed.fill",
                        destination: IntroductionView(),
                        gradientColors: [primaryColor, Color.blue]
                    )
                    
                    HomeButton(
                        title: "Khám phá Cầu thủ nổi tiếng",
                        iconName: "star.fill",
                        destination: PlayersListView(),
                        gradientColors: [accentColor, Color.orange]
                    )
                    
                    HomeButton(
                        title: "Bắt đầu với Bài tập cơ bản",
                        iconName: "figure.basketball",
                        destination: DrillsListView(),
                        gradientColors: [Color.green, Color.mint]
                    )
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top, 50)
            .navigationTitle("CourtSense")
            .navigationBarTitleDisplayMode(.inline) // Đặt tiêu đề ở giữa
        }
    }
}

// Custom View cho các nút bấm để tái sử dụng
struct HomeButton<Destination: View>: View {
    let title: String
    let iconName: String
    let destination: Destination
    let gradientColors: [Color]
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: iconName)
                    .font(.title2)
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: gradientColors),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(15)
            .shadow(color: gradientColors[0].opacity(0.4), radius: 10, x: 0, y: 5)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
    }
}
