import Foundation

struct AppData {
    // Dữ liệu mẫu cho các cầu thủ nổi tiếng
    static let players: [Player] = [
        
        Player(name: "Michael Jordan",
                       imageName: "jordan",
                       famousFor: "Sự thống trị, khả năng ghi điểm và tinh thần cạnh tranh không ngừng nghỉ.",
                       biography: "Michael Jordan được coi là cầu thủ vĩ đại nhất mọi thời đại. Anh đã dẫn dắt Chicago Bulls giành 6 chức vô địch NBA...",
                       stats: ["6x Vô địch NBA", "5x MVP", "10x Vua ghi điểm"],
                       videoFileName: "jordan_highlight"), // Tên file video highlight của Jordan

        Player(name: "Stephen Curry",
                       imageName: "curry",
                       famousFor: "Cách mạng hóa lối chơi bóng rổ với khả năng ném 3 điểm không tưởng.",
                       biography: "Stephen Curry là một trong những tay ném vĩ đại nhất. Anh đã giúp Golden State Warriors tạo ra một kỷ nguyên mới...",
                       stats: ["4x Vô địch NBA", "2x MVP", "Vua ném 3 điểm mọi thời đại"],
                       videoFileName: "curry_highlight"), // Tên file video highlight của Curry

        Player(name: "LeBron James",
                       imageName: "lebron",
                       famousFor: "Sự kết hợp hoàn hảo giữa sức mạnh, kỹ năng và tầm nhìn chiến thuật.",
                       biography: "LeBron James, thường được gọi là 'King James', đã thiết lập nhiều kỷ lục và được coi là một trong những cầu thủ xuất sắc nhất lịch sử...",
                       stats: ["4x Vô địch NBA", "4x MVP", "Vua ghi điểm mọi thời đại"],
                       videoFileName: "lebron_highlight") // Tên file video highlight của LeBron
            ]
    

    // Dữ liệu mẫu cho các bài tập cơ bản
    static let drills: [Drill] = [
            Drill(name: "Lên rổ cơ bản",
                  description: "Bài tập quan trọng để ghi điểm khi di chuyển gần rổ. Tập trung vào kỹ thuật bước chân, động tác tay và kết thúc ở rổ.",
                  instructions: [
                      "Đứng cách rổ khoảng 3-4 mét, ở một góc 45 độ.",
                      "Nhồi bóng tiến về phía rổ.",
                      "Thực hiện hai bước cuối cùng: bước 1 bằng chân ngoài (xa rổ), bước 2 bằng chân trong (gần rổ).",
                      "Nhấc chân trong lên, đồng thời đưa bóng lên cao bằng một tay và nhẹ nhàng thả bóng vào rổ.",
                      "Tập lặp lại 10-15 lần mỗi bên."
                  ],
                  imageName: "layup",
                  videoFileName: "layup",
                  duration: 300), // 5 phút

            Drill(name: "Nhồi bóng cơ bản",
                  description: "Học cách kiểm soát bóng với kỹ thuật nhồi bóng đúng cách. Bài tập này giúp cải thiện cảm giác bóng và sự linh hoạt của cổ tay.",
                  instructions: [
                      "Đứng ở tư thế tấn công: hai chân rộng bằng vai, đầu gối hơi khuỵu.",
                      "Dùng các ngón tay và cổ tay để đẩy bóng xuống sàn, không dùng lòng bàn tay.",
                      "Giữ bóng ở tầm eo hoặc thấp hơn.",
                      "Mắt nhìn thẳng về phía trước, không nhìn bóng.",
                      "Tập nhồi bóng tại chỗ, sau đó di chuyển chậm rãi."
                  ],
                  imageName: "dribbling",
                  videoFileName: "dribbling",
                  duration: 240), // 4 phút
            
            Drill(name: "Kỹ thuật ném rổ",
                  description: "Cải thiện độ chính xác khi ném từ nhiều khoảng cách khác nhau. Tập trung vào tư thế, động tác và lực tay.",
                  instructions: [
                      "Đặt chân ở vị trí thoải mái, chân ném rổ hơi tiến lên trước.",
                      "Giữ bóng bằng hai tay ở tầm ngực, sau đó đưa lên trước mặt.",
                      "Tập trung vào vị trí ném rổ, giữ khuỷu tay thẳng dưới bóng.",
                      "Dùng lực từ chân, hông và tay để ném bóng lên.",
                      "Sau khi ném, cổ tay phải gập xuống (follow-through)."
                  ],
                  imageName: "shooting",
                  videoFileName: "shooting",
                  duration: 600), // 10 phút

        ]
}
