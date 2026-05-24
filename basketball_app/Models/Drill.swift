

// MARK: - Models/Drill.swift

import Foundation
import SwiftUI
import AVKit

struct Drill: Identifiable, Codable {
    let id = UUID()
    var name: String
    var description: String
    var instructions: [String]
    
    // Thêm các thuộc tính mới để lưu trữ dữ liệu ảnh và video
    var imageName: String // Tên ảnh mặc định trong Asset Catalog
    var thumbnailData: Data?
    var detailImageData: Data?
    var videoData: Data? // Thuộc tính mới
    
    var videoFileName: String?
    // Đã xóa thuộc tính videoURLString
    var duration: Int
    var isCompleted: Bool
    
    // Thuộc tính tính toán để lấy URL của video
    var videoURL: URL? {
        if let videoFileName {
            return Bundle.main.url(forResource: videoFileName, withExtension: "mp4")
        }
        return nil
    }

    // Thuộc tính tính toán để tạo UIImage từ dữ liệu ảnh thumbnail
    var uiThumbnailImage: UIImage? {
        if let thumbnailData {
            return UIImage(data: thumbnailData)
        }
        return nil
    }
    
    // Thuộc tính tính toán để tạo UIImage từ dữ liệu ảnh chi tiết
    var uiDetailImage: UIImage? {
        if let detailImageData {
            return UIImage(data: detailImageData)
        }
        return nil
    }
}

// MARK: - Mở rộng cho Codable
extension Drill {
    private enum CodingKeys: String, CodingKey {
        case name, description, instructions, imageName, thumbnailData, detailImageData, videoData, videoFileName, duration, isCompleted
    }
}
