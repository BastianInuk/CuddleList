import SwiftUI
import SwiftData
import BetterSafariView

struct ContentView: View {
    @Environment(\.user) private var user
    
    var body: some View {
        if let accessToken = user.accessToken {
            LoggedIn()
                .environment(AnilistClient(token: accessToken))
        } else {
            Login()
        }
    }
}

struct LoggedIn: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(AnilistClient.self) private var anilistUser
    @Environment(\.user) private var user
    
    @State private var media: [UserAnime] = []

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(media, id: \.id) { media in
                    SeriesOverview(mediaItem: media)
                }
            }
            .navigationTitle("Anime")
        } detail: {
            Text("Select an item")
        }.task {
            let data = try? await anilistUser.userAnime()
            guard let data else { return }
            
            withAnimation {
                self.media = data
            }
        }
    
    }
}

struct SeriesOverview : View {
    let mediaItem: UserAnime
    
    var body: some View {
        HStack {
            AsyncImage(url: mediaItem.media?.coverImage?.medium.flatMap({ URL(string: $0) }))
                .clipShape(.rect(cornerRadius: 5))
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text(mediaItem.media?.title?.userPreferred ?? "No title")
                
                if let episodes = mediaItem.media?.episodes {
                    Text("Episodes: \(mediaItem.progress ?? 0) / \(episodes)")
                } else {
                    Text("Unknown amount of episodes")
                }
                
                // Text("Next episode in: \( Date(timeIntervalSince1970: .init(mediaItem.media?.nextAiringEpisode?.airingAt ?? 0)))")
            }
            
        }
    }
}

#Preview {
    return ContentView()
        //.modelContainer(for: Item.self, inMemory: true)
}
