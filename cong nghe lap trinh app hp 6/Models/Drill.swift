import Foundation

// Định nghĩa lại struct Drill
import Foundation

struct Drill: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let instructions: [String]
    let imageName: String
    let videoFileName: String?
    let duration: Int
    var isCompleted: Bool = false
    
    var videoURL: URL? {
        guard let fileName = videoFileName else {
            return nil
        }
        return Bundle.main.url(forResource: fileName, withExtension: "mp4")
    }
}
