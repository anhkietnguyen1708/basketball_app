import SwiftUI

struct BenefitsView: View {
    var body: some View {
        ZStack {
            // Nền chung cho toàn bộ trang
            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    // Tiêu đề chính của trang
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Lợi Ích Sức Khỏe")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text("Chơi bóng rổ không chỉ là một môn thể thao giải trí mà còn mang lại nhiều lợi ích tuyệt vời cho sức khỏe cả về thể chất và tinh thần.")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    // Card 1: Sức khỏe tim mạch
                    BenefitCardView(
                        title: "1. Tăng cường Sức khỏe Tim mạch",
                        icon: "heart.fill",
                        content: "Bóng rổ là một bài tập cardio tuyệt vời. Hoạt động liên tục như chạy, nhảy và di chuyển giúp tim bơm máu hiệu quả hơn, làm giảm nguy cơ mắc các bệnh tim mạch.",
                        imageName: "cardio_workout", // Mô tả: Hình ảnh minh họa hoạt động cardio
                        imageDescription: "Tập luyện bóng rổ giúp tim khỏe mạnh hơn"
                    )

                    // Card 2: Cải thiện Sức bền và Thể lực
                    BenefitCardView(
                        title: "2. Cải thiện Sức bền và Thể lực",
                        icon: "bolt.fill",
                        content: "Các động tác bùng nổ như chạy nhanh, nhảy cao và đổi hướng liên tục giúp tăng cường sức bền và thể lực tổng thể của cơ thể, đốt cháy nhiều calo.",
                        imageName: "stamina", // Mô tả: Hình ảnh minh họa sức bền, thể lực
                        imageDescription: "Tăng cường sức bền qua các hoạt động liên tục"
                    )

                    // Card 3: Phát triển Chiều cao
                    BenefitCardView(
                        title: "3. Hỗ trợ Phát triển Chiều cao",
                        icon: "arrow.up.circle.fill",
                        content: "Các động tác nhảy cao để bắt bóng, ném rổ và vươn người giúp kéo dãn cơ thể. Điều này đặc biệt hữu ích cho sự phát triển chiều cao ở lứa tuổi đang lớn.",
                        imageName: "height_growth", // Mô tả: Hình ảnh cầu thủ đang nhảy cao
                        imageDescription: "Các động tác nhảy giúp hỗ trợ phát triển chiều cao"
                    )

                    // Card 4: Tăng cường Sự phối hợp
                    BenefitCardView(
                        title: "4. Tăng cường Sự phối hợp",
                        icon: "eye.circle.fill",
                        content: "Bóng rổ đòi hỏi sự phối hợp nhịp nhàng giữa tay, mắt và chân. Nhồi bóng, chuyền bóng và ném rổ giúp cải thiện kỹ năng vận động tinh (fine motor skills) và phản xạ.",
                        imageName: "coordination", // Mô tả: Hình ảnh phối hợp tay mắt
                        imageDescription: "Cải thiện sự phối hợp tay-mắt-chân"
                    )

                    // Card 5: Giảm căng thẳng
                    BenefitCardView(
                        title: "5. Giảm căng thẳng và Cải thiện Tinh thần",
                        icon: "face.smiling.fill",
                        content: "Tập trung vào trận đấu giúp bạn quên đi những lo âu hàng ngày. Hoạt động thể chất giúp cơ thể sản sinh endorphin, một loại hormone hạnh phúc, giúp giải tỏa căng thẳng và cải thiện tâm trạng.",
                        imageName: "stress_relief", // Mô tả: Hình ảnh người chơi bóng rổ vui vẻ
                        imageDescription: "Giảm stress, cải thiện tinh thần và sự tự tin"
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
        .navigationTitle("Lợi Ích Sức Khỏe")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Custom View cho từng Card lợi ích
struct BenefitCardView: View {
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
                    .foregroundColor(.green)
                
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
struct ImagePlaceholderView3: View {
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

struct BenefitsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BenefitsView()
        }
    }
}
