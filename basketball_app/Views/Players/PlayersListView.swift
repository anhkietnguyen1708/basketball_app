import SwiftUI

struct PlayersListView: View {
    var body: some View {
        List(AppData.players) { player in
            NavigationLink {
                PlayerDetailView(player: player)
            } label: {
                HStack {
                    Image(player.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    Text(player.name)
                        .font(.headline)
                        .padding(.leading, 10)
                }
            }
        }
        .navigationTitle("Cầu Thủ")
    }
}

struct PlayersListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlayersListView()
        }
    }
}
