


// MARK: - Views/Drills/DrillsListView.swift

import SwiftUI

struct DrillsListView: View {
    @State private var drills = AppData.drills

    var completedDrillsCount: Int {
        drills.filter { $0.isCompleted }.count
    }

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Tiến độ của bạn")) {
                    Text("Bạn đã hoàn thành \(completedDrillsCount) trên \(drills.count) bài tập")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                
                Section(header: Text("Danh sách các bài tập")) {
                    ForEach($drills) { $drill in
                        NavigationLink {
                            DrillDetailView(drill: $drill)
                        } label: {
                            HStack {
                                if let uiThumbnailImage = drill.uiThumbnailImage {
                                    Image(uiImage: uiThumbnailImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(10)
                                } else {
                                    Image(drill.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(10)
                                }

                                Text(drill.name)
                                    .font(.headline)
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                if drill.isCompleted {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                }
                            }
                        }
                    }
                    .onDelete(perform: deleteDrills) // Thêm chức năng vuốt để xóa
                }
            }
            .navigationTitle("Bài Tập Cơ Bản")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddDrillView(drills: $drills)) {
                        Label("Thêm", systemImage: "plus")
                    }
                }
            }
        }
    }

    // Phương thức để xử lý việc xóa
    private func deleteDrills(at offsets: IndexSet) {
        drills.remove(atOffsets: offsets)
    }
}
