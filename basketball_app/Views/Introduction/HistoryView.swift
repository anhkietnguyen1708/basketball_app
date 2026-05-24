import SwiftUI

struct HistoryView: View {
    var body: some View {
        // Sử dụng ZStack để thêm background
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    // Phần giới thiệu
                    Section(header: Text("Nguồn gốc")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top, 20)
                    ) {
                        Text("Bóng rổ được phát minh vào tháng 12 năm 1891 bởi **James Naismith**, một giáo viên thể dục người Canada. Ông muốn tạo ra một môn thể thao đồng đội có thể chơi trong nhà vào mùa đông, ít bạo lực hơn bóng đá và bóng bầu dục.")
                            .font(.body)
                            .padding(.bottom, 5)
                        
                        // Chỗ chèn hình ảnh: James Naismith
                        ImagePlaceholderView(imageName: "naismith", description: "James Naismith - cha đẻ của bóng rổ")
                            .scaledToFit()
                        
                        Text("Trận đấu đầu tiên sử dụng một quả bóng đá và hai chiếc rổ đào được treo trên lan can của phòng tập thể dục. Các quy tắc ban đầu rất đơn giản, chỉ có 13 điều khoản cơ bản.")
                            .font(.body)
                    }
                    .padding(.horizontal)
                    
                    
                    Divider()
                    
                    Section(header: Text("Phát triển và Lan rộng")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    ) {
                        Text("Trận đấu bóng rổ công khai đầu tiên diễn ra vào ngày 11 tháng 3 năm 1892. Môn thể thao này nhanh chóng lan rộng ra các trường đại học và cao đẳng ở Hoa Kỳ.")
                            .font(.body)
                            .padding(.bottom, 5)
                        
                        // Chỗ chèn hình ảnh: Trận đấu bóng rổ đầu tiên
                        ImagePlaceholderView(imageName: "first_game", description: "Mô phỏng trận đấu bóng rổ đầu tiên")
                        
                        Text("Vào đầu thế kỷ 20, bóng rổ đã trở nên phổ biến trên toàn thế giới. Giải đấu quốc tế đầu tiên được tổ chức vào năm 1904 và bóng rổ chính thức trở thành môn thể thao Olympic vào năm 1936 tại Berlin.")
                            .font(.body)
                    }
                    .padding(.horizontal)
                    
                    // Phần Sự ra đời của NBA
                    Divider()
                    
                    Section(header: Text("Sự ra đời của NBA")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    ) {
                        Text("Liên đoàn Bóng rổ Quốc gia (**NBA**) được thành lập vào năm 1946 với tên gọi ban đầu là BAA (Basketball Association of America). Sự ra đời của NBA đã đưa bóng rổ chuyên nghiệp lên một tầm cao mới, với sự xuất hiện của những huyền thoại như Bill Russell, Wilt Chamberlain và sau này là Michael Jordan, Kobe Bryant, LeBron James.")
                            .font(.body)
                            .padding(.bottom, 5)
                        
                        // Chỗ chèn hình ảnh: Logo NBA
                        ImagePlaceholderView(imageName: "nba_logo", description: "Logo NBA")
                        
                        Text("Ngày nay, bóng rổ không chỉ là một môn thể thao, mà còn là một nét văn hóa, truyền cảm hứng cho hàng triệu người trên toàn cầu.")
                            .font(.body)
                    }
                    .padding([.horizontal, .bottom])
                }
            }
        }
        .navigationTitle("Lịch sử Bóng rổ")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Custom View để tạo khung hình ảnh có viền và đổ bóng
struct ImagePlaceholderView: View {
    let imageName: String
    let description: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
                .cornerRadius(15)
                .shadow(radius: 5)
            
            Text(description)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical, 10)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HistoryView()
        }
    }
}

