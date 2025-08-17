import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // Tab 1: Trang Chủ
            NavigationStack { // Sử dụng NavigationStack cho mỗi tab để quản lý điều hướng
                HomeView()
            }
            .tabItem {
                Label("Trang Chủ", systemImage: "house.fill")
            }

            // Tab 2: Giới thiệu
            NavigationStack {
                IntroductionView()
            }
            .tabItem {
                Label("Giới Thiệu", systemImage: "info.circle.fill")
            }

            // Tab 3: Cầu thủ
            NavigationStack {
                PlayersListView()
            }
            .tabItem {
                Label("Cầu Thủ", systemImage: "person.3.fill")
            }

            // Tab 4: Bài tập
            NavigationStack {
                DrillsListView()
            }
            .tabItem {
                Label("Bài Tập", systemImage: "basketball.fill")
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
