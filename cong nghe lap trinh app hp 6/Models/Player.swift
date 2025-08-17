import Foundation

struct Player: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let famousFor: String
    let biography: String
    let stats: [String]
    let videoFileName: String? // Thêm thuộc tính này
    
    var videoURL: URL? {
        guard let fileName = videoFileName else {
            return nil
        }
        return Bundle.main.url(forResource: fileName, withExtension: "mp4")
    }
}
