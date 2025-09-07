
// MARK: - Views/Drills/DrillDetailView.swift

import SwiftUI
import AVKit
import WebKit

struct DrillDetailView: View {
    @Binding var drill: Drill

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // MARK: Phần Tiêu đề
                HStack {
                    Text(drill.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                    
                    Spacer()
                    
                    if drill.isCompleted {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title)
                            .foregroundColor(.green)
                    }
                }
                
                // MARK: Phần Thời gian
                DrillTimerView(duration: drill.duration, isCompleted: $drill.isCompleted)

                Divider()

                // MARK: Phần Video
                VStack(alignment: .leading, spacing: 10) {
                    Text("Video Minh Họa:")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.green)

                    if let videoData = drill.videoData,
                       let tempFileURL = saveVideoToTempFile(data: videoData) {
                        VideoPlayer(player: AVPlayer(url: tempFileURL))
                            .frame(height: 200)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    } else if let videoURL = drill.videoURL {
                        VideoPlayer(player: AVPlayer(url: videoURL))
                            .frame(height: 200)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    } else {
                        Image(systemName: "video.slash.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .foregroundColor(.gray)
                    }
                }
                
                // MARK: Phần Hình ảnh minh họa
                VStack(alignment: .leading, spacing: 10) {
                    Text("Hình Ảnh Minh Họa:")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.orange)
                    
                    if let uiDetailImage = drill.uiDetailImage {
                        Image(uiImage: uiDetailImage)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    } else {
                        Image(drill.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    }
                }

                // MARK: Phần Mô tả
                VStack(alignment: .leading, spacing: 10) {
                    Text("Mô tả:")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.purple)

                    Text(drill.description)
                        .font(.body)
                        .foregroundColor(.primary)
                }

                Divider()

                // MARK: Phần Hướng dẫn từng bước
                VStack(alignment: .leading, spacing: 10) {
                    Text("Hướng Dẫn Từng Bước:")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.red)

                    ForEach(drill.instructions.indices, id: \.self) { index in
                        HStack(alignment: .top, spacing: 10) {
                            Text("\(index + 1).")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .frame(width: 25, alignment: .leading)
                            Text(drill.instructions[index])
                                .font(.body)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
            .padding()
            .background(Color(.systemGray6).opacity(0.3))
        }
        .navigationTitle("Chi Tiết Bài Tập")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func saveVideoToTempFile(data: Data) -> URL? {
        let tempDirectoryURL = FileManager.default.temporaryDirectory
        let tempFileURL = tempDirectoryURL.appendingPathComponent(UUID().uuidString).appendingPathExtension("mov")
        do {
            try data.write(to: tempFileURL)
            return tempFileURL
        } catch {
            print("Lỗi khi lưu video tạm thời: \(error)")
            return nil
        }
    }
}
