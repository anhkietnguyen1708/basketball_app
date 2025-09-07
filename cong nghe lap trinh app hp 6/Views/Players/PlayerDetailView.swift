// MARK: - Views/Players/PlayerDetailView.swift

import SwiftUI
import AVKit

struct PlayerDetailView: View {
    let player: Player

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // MARK: Hình ảnh cầu thủ
                ZStack(alignment: .bottomLeading) {
                    Image(player.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .clipped()
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(player.name)
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 20)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.6)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                }
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(.horizontal)

                // MARK: Video Highlight
                if let videoURL = player.videoURL {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Video Highlight:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.orange)
                        
                        VideoPlayer(player: AVPlayer(url: videoURL))
                            .aspectRatio(16/9, contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                }

                // MARK: Chi tiết
                VStack(alignment: .leading, spacing: 15) {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                            Text("Nổi tiếng với:")
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                        Text(player.famousFor)
                            .font(.body)
                    }
                    
                    Divider().padding(.vertical, 5)

                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Image(systemName: "person.text.rectangle").foregroundColor(.blue)
                            Text("Tiểu sử:")
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                        Text(player.biography)
                            .font(.body)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding(.horizontal)

                // MARK: Thống kê nổi bật
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Image(systemName: "chart.bar.fill").foregroundColor(.green)
                        Text("Thống kê nổi bật:")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    ForEach(player.stats, id: \.self) { stat in
                        HStack(spacing: 10) {
                            Text("•").fontWeight(.bold)
                            Text(stat)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding(.horizontal)
            }
            .padding(.bottom, 30)
        }
        .navigationTitle(player.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}



