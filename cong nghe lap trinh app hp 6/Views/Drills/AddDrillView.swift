
// MARK: - Views/Drills/AddDrillView.swift

import SwiftUI
import PhotosUI

struct AddDrillView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var drills: [Drill]

    @State private var name: String = ""
    @State private var description: String = ""
    @State private var instructions: String = ""
    @State private var duration: Int = 120
    
    // State cho ảnh đại diện
    @State private var thumbnailItem: PhotosPickerItem?
    @State private var thumbnailData: Data?

    // State cho ảnh minh họa chi tiết
    @State private var detailImageItem: PhotosPickerItem?
    @State private var detailImageData: Data?
    
    // State cho video
    @State private var videoItem: PhotosPickerItem?
    @State private var videoData: Data?
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Thông tin cơ bản")) {
                    TextField("Tên bài tập", text: $name)
                    TextField("Mô tả", text: $description)
                }
                
                Section(header: Text("Ảnh đại diện (Thumbnail)")) {
                    VStack {
                        if let thumbnailData,
                           let uiImage = UIImage(data: thumbnailData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                                .cornerRadius(10)
                        } else {
                            Image(systemName: "photo.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.gray)
                        }
                        
                        PhotosPicker(
                            selection: $thumbnailItem,
                            matching: .images,
                            photoLibrary: .shared()) {
                                Text("Chọn Ảnh Đại Diện")
                        }
                    }
                    .onChange(of: thumbnailItem) { newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                thumbnailData = data
                            }
                        }
                    }
                }
                
                Section(header: Text("Ảnh minh họa chi tiết")) {
                    VStack {
                        if let detailImageData,
                           let uiImage = UIImage(data: detailImageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                                .cornerRadius(10)
                        } else {
                            Image(systemName: "photo.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.gray)
                        }
                        
                        PhotosPicker(
                            selection: $detailImageItem,
                            matching: .images,
                            photoLibrary: .shared()) {
                                Text("Chọn Ảnh Minh Họa")
                        }
                    }
                    .onChange(of: detailImageItem) { newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                detailImageData = data
                            }
                        }
                    }
                }

                Section(header: Text("Video minh họa")) {
                    VStack(alignment: .leading) {
                        if let videoData {
                            Text("Video đã được chọn.")
                                .foregroundColor(.green)
                        } else {
                            Text("Chưa có video được chọn.")
                                .foregroundColor(.gray)
                        }
                        
                        PhotosPicker(
                            selection: $videoItem,
                            matching: .videos,
                            photoLibrary: .shared()) {
                                Text("Chọn Video")
                        }
                    }
                    .onChange(of: videoItem) { newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                videoData = data
                            }
                        }
                    }
                }
                
                Section(header: Text("Hướng dẫn từng bước")) {
                    TextEditor(text: $instructions)
                        .frame(height: 150)
                }
                
                Section(header: Text("Thời gian")) {
                    Stepper("Thời gian: \(duration) giây", value: $duration, in: 60...600, step: 60)
                }
            }
            .navigationTitle("Thêm Bài Tập Mới")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Lưu") {
                        saveNewDrill()
                        dismiss()
                    }
                    .disabled(name.isEmpty || description.isEmpty || instructions.isEmpty)
                }
            }
        }
    }

    private func saveNewDrill() {
        let newDrill = Drill(
            name: name,
            description: description,
            instructions: instructions.components(separatedBy: "\n"),
            imageName: "default_drill",
            thumbnailData: thumbnailData,
            detailImageData: detailImageData,
            videoData: videoData,
            videoFileName: nil,
            duration: duration,
            isCompleted: false
        )
        drills.append(newDrill)
    }
}
