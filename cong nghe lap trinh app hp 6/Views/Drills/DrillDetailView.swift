// MARK: - Views/Drills/DrillDetailView.swift

import SwiftUI
import AVKit

struct DrillDetailView: View {
    @Binding var drill: Drill

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) { // Giảm spacing để nội dung gần nhau hơn
                // MARK: Phần Tiêu đề
                HStack {
                    Text(drill.name)
                        .font(.title) // Giảm font size của tiêu đề
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .lineLimit(1) // Giới hạn một dòng để tránh xuống hàng
                        .minimumScaleFactor(0.8) // Tự động giảm kích thước chữ nếu quá dài
                    
                    Spacer()
                    
                    if drill.isCompleted {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title2)
                            .foregroundColor(.green)
                    }
                }
                
                // MARK: Phần Thời gian
                DrillTimerView(duration: drill.duration, isCompleted: $drill.isCompleted)

                Divider()

                // MARK: Phần Video (nếu có)
                
                if let videoURL = drill.videoURL {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Video Minh Họa:")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.green)

                        // Truyền trực tiếp đối tượng 'URL' vào AVPlayer
                        VideoPlayer(player: AVPlayer(url: videoURL))
                            .frame(height: 200)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    }
                }

                // MARK: Phần Hình ảnh minh họa
                VStack(alignment: .leading, spacing: 8) {
                    Text("Hình Ảnh Minh Họa:")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.orange)

                    Image(drill.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 180) // Giảm chiều cao hình ảnh
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }

                // MARK: Phần Mô tả
                VStack(alignment: .leading, spacing: 8) {
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
                VStack(alignment: .leading, spacing: 8) {
                    Text("Hướng Dẫn Từng Bước:")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.red)

                    ForEach(drill.instructions.indices, id: \.self) { index in
                        HStack(alignment: .top, spacing: 8) {
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
}
