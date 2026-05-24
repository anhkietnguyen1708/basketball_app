import SwiftUI

struct RulesView: View {
    var body: some View {
        ZStack {
            // Nền chung cho toàn bộ trang
            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    // Tiêu đề chính của trang
                    Text("Luật Bóng rổ Đơn giản")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                        .padding(.top, 20)
                        .padding(.bottom, 10)

                    // Giới thiệu chung
                    RuleSectionView(
                        title: "Giới thiệu chung",
                        icon: "info.circle.fill",
                        content: """
                        Bóng rổ là môn thể thao đồng đội, nơi hai đội cố gắng ghi điểm bằng cách đưa bóng vào rổ của đối phương. Trò chơi đòi hỏi sự nhanh nhẹn, kỹ năng, chiến thuật và tinh thần đồng đội.
                        """,
                        imageName: "basketball_court", // Mô tả: Sân bóng rổ tổng quan
                        imageDescription: "Sân bóng rổ với các đường kẻ và rổ"
                    )

                    // Luật 1: Mục tiêu và Điểm số
                    RuleSectionView(
                        title: "1. Mục tiêu và Điểm số",
                        icon: "target",
                        content: """
                        Mục tiêu chính là đưa bóng vào rổ đối phương để ghi điểm.
                        -   **2 điểm**: Khi ném bóng vào rổ từ bên trong vòng cung 3 điểm.
                        -   **3 điểm**: Khi ném bóng vào rổ từ bên ngoài vòng cung 3 điểm.
                        -   **1 điểm**: Khi ném phạt thành công (sau khi đối phương phạm lỗi).
                        """,
                        imageName: "scoring_points", // Mô tả: Hình ảnh minh họa cách ghi điểm (2 điểm, 3 điểm)
                        imageDescription: "Minh họa cách ghi 2 và 3 điểm trong bóng rổ"
                    )

                    // Luật 2: Số lượng cầu thủ
                    RuleSectionView(
                        title: "2. Số lượng Cầu thủ",
                        icon: "person.3.fill",
                        content: """
                        Mỗi đội có 5 cầu thủ trên sân cùng một lúc. Các cầu thủ dự bị có thể được thay vào trong các tình huống dừng trận đấu (ví dụ: sau khi ghi điểm, phạm lỗi, hoặc bóng ra ngoài).
                        """,
                        imageName: "team_players", // Mô tả: Hình ảnh đội bóng rổ 5 người
                        imageDescription: "Đội bóng rổ 5 người trên sân"
                    )

                    // Luật 3: Cách di chuyển bóng
                    RuleSectionView(
                        title: "3. Cách di chuyển bóng",
                        icon: "figure.walk.circle.fill",
                        content: """
                        Cầu thủ phải di chuyển bóng bằng cách nhồi bóng (dribble) hoặc chuyền bóng (pass) cho đồng đội.
                        -   Nhồi bóng (Dribbling): Đẩy bóng xuống sàn liên tục bằng một tay.
                        -   Chuyền bóng (Passing): Ném bóng cho đồng đội.
                        """,
                        imageName: "dribbling_ball", // Mô tả: Hình ảnh cầu thủ đang nhồi bóng
                        imageDescription: "Cầu thủ đang nhồi bóng trên sân"
                    )
                    
                    // Luật 4: Các Lỗi (Fouls) và Vi phạm (Violations)
                    RuleSectionView(
                        title: "4. Các Lỗi (Fouls) và Vi phạm (Violations)",
                        icon: "hand.raised.fill",
                        content: """
                        Có hai loại lỗi chính: Lỗi cá nhân (Personal Fouls) và Lỗi kỹ thuật (Technical Fouls). Ngoài ra còn có các vi phạm luật chơi.
                        """,
                        imageName: "foul_call", // Mô tả: Trọng tài thổi còi báo lỗi
                        imageDescription: "Trọng tài ra hiệu lỗi"
                    )
                    
                    // Chi tiết về Lỗi Cá nhân
                    SubRuleSectionView(
                        title: "4.1. Lỗi Cá nhân (Personal Fouls)",
                        icon: "hand.point.up.braille.fill",
                        content: """
                        Là các hành vi tiếp xúc cơ thể trái phép với đối thủ. Khi một cầu thủ phạm lỗi cá nhân, đội đối phương sẽ được ném phạt hoặc giữ bóng.
                        -   **Đẩy (Pushing)**: Dùng tay hoặc thân người đẩy đối thủ.
                        -   **Giữ (Holding)**: Giữ đối thủ bằng tay hoặc thân người để cản trở di chuyển.
                        -   **Ngáng chân (Tripping)**: Dùng chân hoặc thân người làm đối thủ vấp ngã.
                        -   **Phòng thủ bất hợp pháp (Illegal Defense)**: Cản trở đối thủ mà không ở đúng vị trí phòng thủ.
                        -   **Cản người (Blocking)**: Cản trở di chuyển của đối thủ khi không đứng yên hoặc không cho đối thủ có đủ không gian.
                        -   **Tấn công (Charging)**: Cầu thủ tấn công va chạm với cầu thủ phòng thủ đã đứng yên ở vị trí hợp lệ.
                        """,
                        imageName: "charging_foul", // Mô tả: Hình ảnh minh họa lỗi tấn công (charging)
                        imageDescription: "Cầu thủ tấn công phạm lỗi charging"
                    )
                    
                    // Chi tiết về Lỗi Kỹ thuật
                    SubRuleSectionView(
                        title: "4.2. Lỗi Kỹ thuật (Technical Fouls)",
                        icon: "exclamationmark.triangle.fill",
                        content: """
                        Là các hành vi phi thể thao hoặc vi phạm luật không liên quan đến tiếp xúc cơ thể.
                        -   Cãi vã với trọng tài.
                        -   Sử dụng ngôn ngữ thô tục.
                        -   Cố tình trì hoãn trận đấu.
                        -   Treo người trên vành rổ (trừ khi để tránh chấn thương).
                        """,
                        imageName: "technical_foul", // Mô tả: Hình ảnh trọng tài ra hiệu lỗi kỹ thuật
                        imageDescription: "Trọng tài ra hiệu lỗi kỹ thuật"
                    )

                    // Chi tiết về Vi phạm (Violations)
                    SubRuleSectionView(
                        title: "4.3. Vi phạm (Violations)",
                        icon: "xmark.octagon.fill",
                        content: """
                        Là các hành vi vi phạm luật chơi mà không liên quan đến tiếp xúc cơ thể. Kết quả là đội đối phương sẽ được quyền kiểm soát bóng.
                        -   **Chạy bước (Traveling)**: Di chuyển chân khi đang giữ bóng mà không nhồi bóng.
                        -   **Nhồi bóng hai lần (Double Dribble)**: Nhồi bóng bằng hai tay cùng lúc, hoặc nhồi bóng, dừng lại rồi nhồi bóng tiếp.
                        -   **Lỗi 3 giây (3-second Violation)**: Cầu thủ tấn công ở trong khu vực hình thang (key) của đối phương quá 3 giây.
                        -   **Lỗi 8 giây (8-second Violation)**: Đội tấn công không đưa bóng qua vạch giữa sân trong vòng 8 giây.
                        -   **Lỗi 24 giây (24-second Violation)**: Đội tấn công không ném bóng vào rổ trong vòng 24 giây.
                        -   **Goaltending/Basket Interference**: Cản trở bóng khi bóng đang trên đường đi xuống rổ hoặc đang ở trong vành rổ.
                        """,
                        imageName: "traveling_violation", // Mô tả: Hình ảnh minh họa lỗi chạy bước (traveling)
                        imageDescription: "Cầu thủ phạm lỗi chạy bước"
                    )

                    // Luật 5: Thời gian thi đấu
                    RuleSectionView(
                        title: "5. Thời gian thi đấu",
                        icon: "clock.fill",
                        content: """
                        Một trận đấu bóng rổ thường được chia thành các hiệp (quarters) hoặc hai hiệp (halves).
                        -   **NBA**: 4 hiệp, mỗi hiệp 12 phút.
                        -   **FIBA/Đại học**: 4 hiệp, mỗi hiệp 10 phút.
                        -   **Thời gian tấn công (Shot Clock)**: Đội tấn công phải ném bóng vào rổ trong một khoảng thời gian nhất định (thường là 24 giây ở NBA/FIBA).
                        """,
                        imageName: "game_clock", // Mô tả: Đồng hồ trận đấu hoặc shot clock
                        imageDescription: "Đồng hồ trận đấu và shot clock"
                    )
                }
                .padding(.bottom, 20) // Đảm bảo có khoảng trống ở cuối
            }
        }
        .navigationTitle("Luật Bóng rổ")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Custom View cho các phần luật chính
struct RuleSectionView: View {
    let title: String
    let icon: String
    let content: String
    let imageName: String? // Optional image
    let imageDescription: String? // Optional image description

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(.accentColor) // Màu sắc nổi bật
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding(.bottom, 5)

            Text(content)
                .font(.body)
                .lineLimit(nil) // Cho phép hiển thị nhiều dòng
            
            if let imgName = imageName, let imgDesc = imageDescription {
                ImagePlaceholderView(imageName: imgName, description: imgDesc)
                    .padding(.top, 10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
        .padding(.horizontal)
    }
}

// Custom View cho các phần luật con (như các loại lỗi)
struct SubRuleSectionView: View {
    let title: String
    let icon: String
    let content: String
    let imageName: String? // Optional image
    let imageDescription: String? // Optional image description

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(.secondary)
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .padding(.bottom, 5)

            Text(content)
                .font(.callout)
                .lineLimit(nil) // Cho phép hiển thị nhiều dòng
            
            if let imgName = imageName, let imgDesc = imageDescription {
                ImagePlaceholderView(imageName: imgName, description: imgDesc)
                    .padding(.top, 10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding(.horizontal, 25) // Thụt vào một chút so với RuleSectionView
    }
}


// Sử dụng lại ImagePlaceholderView đã sửa từ lần trước
struct ImagePlaceholderView1: View {
    let imageName: String
    let description: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(imageName)
                .resizable()
                .scaledToFit() // Đảm bảo hình ảnh không bị cắt
                .frame(maxHeight: 200) // Chiều cao tối đa cho hình ảnh
                .cornerRadius(10)
                .shadow(radius: 3)
            
            Text(description)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}


struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RulesView()
        }
    }
}
