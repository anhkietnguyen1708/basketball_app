// MARK: - Views/Drills/DrillsListView.swift

import SwiftUI

struct DrillsListView: View {
    // Sử dụng @State để quản lý danh sách drills, cho phép cập nhật trạng thái
    @State private var drills = AppData.drills

    // Computed property để tính số bài tập đã hoàn thành
    var completedDrillsCount: Int {
        drills.filter { $0.isCompleted }.count
    }

    var body: some View {
        NavigationStack {
            List {
                // MARK: Phần thông tin tiến độ
                Section(header: Text("Tiến độ của bạn")) {
                    Text("Bạn đã hoàn thành \(completedDrillsCount) trên \(drills.count) bài tập")
                        .font(.headline)
                        .foregroundColor(.blue)
                }

                // MARK: Danh sách các bài tập
                Section(header: Text("Danh sách các bài tập")) {
                    // Sử dụng ForEach với '$' để tạo Binding cho mỗi drill
                    ForEach($drills) { $drill in
                        NavigationLink {
                            // Truyền Binding của drill vào DrillDetailView
                            DrillDetailView(drill: $drill)
                        } label: {
                            HStack {
                                Image(drill.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(10)

                                Text(drill.name)
                                    .font(.headline)
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                // Hiển thị dấu tích nếu bài tập đã hoàn thành
                                if drill.isCompleted {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Bài Tập Cơ Bản")
        }
    }
}

struct DrillsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DrillsListView()
        }
    }
}
