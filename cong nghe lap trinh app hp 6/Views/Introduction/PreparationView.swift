import SwiftUI

struct PreparationView: View {
    var body: some View {
        ZStack {
            // Nền chung cho toàn bộ trang
            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    // Tiêu đề chính của trang
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Các Chuẩn Bị Cần Có")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)

                        Text("Để có một buổi chơi bóng rổ hiệu quả, an toàn và thú vị, bạn cần chuẩn bị một vài thứ cơ bản.")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    // Card 1: Bóng rổ
                    PreparationCardView(
                        title: "1. Bóng rổ",
                        icon: "basketball.fill",
                        content: "Chọn kích cỡ bóng phù hợp với lứa tuổi và giới tính để dễ dàng cầm, chuyền và ném. Bóng Size 7 cho nam giới trưởng thành, Size 6 cho nữ giới và thiếu niên, và Size 5 cho trẻ em.",
                        imageName: "basketball_ball", // Mô tả: Một quả bóng rổ
                        imageDescription: "Chọn bóng rổ có kích cỡ phù hợp"
                    )

                    // Card 2: Giày bóng rổ
                    PreparationCardView(
                        title: "2. Giày bóng rổ",
                        icon: "figure.walk",
                        content: "Giày chuyên dụng có thiết kế đặc biệt để bảo vệ mắt cá chân, giảm chấn thương và tăng độ bám trên sân. Đừng dùng giày chạy bộ, vì nó không đủ hỗ trợ cho các chuyển động ngang.",
                        imageName: "basketball_shoes", // Mô tả: Một đôi giày bóng rổ
                        imageDescription: "Giày bóng rổ chuyên dụng giúp bảo vệ mắt cá chân"
                    )

                    // Card 3: Trang phục
                    PreparationCardView(
                        title: "3. Trang phục thoải mái",
                        icon: "tshirt.fill",
                        content: "Mặc quần áo thể thao rộng rãi, thoáng mát, có khả năng thấm hút mồ hôi tốt. Áo ba lỗ, áo phông và quần short là lựa chọn phổ biến.",
                        imageName: "sports_uniform", // Mô tả: Quần áo thể thao
                        imageDescription: "Trang phục thoáng mát giúp bạn thoải mái di chuyển"
                    )

                    // Card 4: Nước uống
                    PreparationCardView(
                        title: "4. Nước uống",
                        icon: "drop.fill",
                        content: "Luôn mang theo chai nước để giữ cơ thể đủ nước trong suốt quá trình tập luyện. Đừng đợi đến khi khát mới uống, hãy uống từng ngụm nhỏ đều đặn.",
                        imageName: "water_bottle", // Mô tả: Chai nước thể thao
                        imageDescription: "Uống đủ nước để duy trì năng lượng"
                    )

                    // Card 5: Khởi động
                    PreparationCardView(
                        title: "5. Khởi động kỹ",
                        icon: "figure.run",
                        content: "Đây là bước quan trọng nhất để tránh chấn thương. Hãy dành 5-10 phút để khởi động các khớp như cổ chân, đầu gối, hông và vai. Chạy nhẹ tại chỗ và giãn cơ cơ bản.",
                        imageName: "stretching", // Mô tả: Hình ảnh người đang khởi động giãn cơ
                        imageDescription: "Khởi động kỹ lưỡng để tránh chấn thương"
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
        .navigationTitle("Chuẩn Bị")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Custom View cho từng Card chuẩn bị
struct PreparationCardView: View {
    let title: String
    let icon: String
    let content: String
    let imageName: String?
    let imageDescription: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(spacing: 15) {
                Image(systemName: icon)
                    .font(.title)
                    .foregroundColor(.accentColor)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(content)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                }
            }
            
            if let imgName = imageName, let imgDesc = imageDescription {
                ImagePlaceholderView(imageName: imgName, description: imgDesc)
                    .padding(.top, 10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

// Sử dụng lại ImagePlaceholderView đã có
struct ImagePlaceholderView2: View {
    let imageName: String
    let description: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 200)
                .cornerRadius(10)
                .shadow(radius: 3)
            
            Text(description)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}

struct PreparationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PreparationView()
        }
    }
}
