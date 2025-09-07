
// MARK: - AppData.swift

import Foundation

class AppData {
    static var drills: [Drill] = [
        Drill(name: "Lên rổ cơ bản",
              description: "Một bài tập đơn giản để rèn luyện kỹ năng lên rổ, bao gồm cả tay trái và tay phải. Tập trung vào việc sử dụng bảng rổ để ghi điểm.",
              instructions: ["Bắt đầu từ vạch 3 điểm.", "Dẫn bóng về phía rổ.", "Thực hiện bước lên rổ bằng tay phải.", "Lặp lại với tay trái."],
              imageName: "layup",
              thumbnailData: nil,
              detailImageData: nil,
              videoData: nil,
              videoFileName: "layup",
              duration: 120,
              isCompleted: false),
        Drill(name: "Nhồi bóng cơ bản",
              description: "Rèn luyện khả năng kiểm soát bóng, bao gồm đổi tay, nhồi bóng cao và thấp.",
              instructions: ["Nhồi bóng tại chỗ bằng tay phải 30 giây.", "Nhồi bóng tại chỗ bằng tay trái 30 giây.", "Đổi tay liên tục 30 giây.", "Đi bộ và nhồi bóng, đổi tay."],
              imageName: "dribbling",
              thumbnailData: nil,
              detailImageData: nil,
              videoData: nil,
              videoFileName: "dribbling",
              duration: 180,
              isCompleted: false),
        Drill(name: "Kỹ thuật ném rổ",
              description: "Tập trung vào kỹ thuật ném rổ ở các vị trí khác nhau trên sân.",
              instructions: ["Ném rổ từ vạch ném phạt.", "Ném rổ từ 45 độ ở cả hai bên.", "Ném rổ từ vạch 3 điểm."],
              imageName: "shooting",
              thumbnailData: nil,
              detailImageData: nil,
              videoData: nil,
              videoFileName: "shooting",
              duration: 300,
              isCompleted: false)
    ]
    
    static var players: [Player] = [
        Player(name: "Michael Jordan",
                               imageName: "jordan",
                               famousFor: "Sự thống trị, khả năng ghi điểm và tinh thần cạnh tranh không ngừng nghỉ.",
                               biography: "Michael Jordan được coi là cầu thủ vĩ đại nhất mọi thời đại. Anh đã dẫn dắt Chicago Bulls giành 6 chức vô địch NBA...",
                               stats: ["6x Vô địch NBA", "5x MVP", "10x Vua ghi điểm"],
                               videoFileName: "jordan_highlight"),
        
                        Player(name: "Stephen Curry",
                               imageName: "curry",
                               famousFor: "Cách mạng hóa lối chơi bóng rổ với khả năng ném 3 điểm không tưởng.",
                               biography: "Stephen Curry là một trong những tay ném vĩ đại nhất. Anh đã giúp Golden State Warriors tạo ra một kỷ nguyên mới...",
                               stats: ["4x Vô địch NBA", "2x MVP", "Vua ném 3 điểm mọi thời đại"],
                               videoFileName: "curry_highlight"),
        
                        Player(name: "LeBron James",
                               imageName: "lebron",
                               famousFor: "Sự kết hợp hoàn hảo giữa sức mạnh, kỹ năng và tầm nhìn chiến thuật.",
                               biography: "LeBron James, thường được gọi là 'King James', đã thiết lập nhiều kỷ lục và được coi là một trong những cầu thủ xuất sắc nhất lịch sử...",
                               stats: ["4x Vô địch NBA", "4x MVP", "Vua ghi điểm mọi thời đại"],
                               videoFileName: "lebron_highlight")
    ]
}
