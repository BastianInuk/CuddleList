import SwiftUI
import BetterSafariView

struct Login: View {
    @Environment(\.user) private var user
    @State private var startingWebAuthenticationSession = false
    
    var body: some View {
        Button("Login") {
            startingWebAuthenticationSession = true
        }.webAuthenticationSession(isPresented: $startingWebAuthenticationSession) {
                login()
            }
    }
    
    func login() -> WebAuthenticationSession {
        let clientId = 14833
        let scheme = "fastList"
        return WebAuthenticationSession(
               url: URL(string: "https://anilist.co/api/v2/oauth/authorize?client_id=\(clientId)&response_type=token")!,
               callbackURLScheme: scheme
           ) { result in
               switch result {
               case .success(let callbackURL):
                   guard let splits = URLComponents(string: callbackURL.absoluteString)?
                        .fragment?
                        .split(separator: "&") else {
                       return
                   }
                   
                   var dict = [String: String]()
                   for split in splits {
                       let subSplit = split.split(separator: "=")
                       dict[String(subSplit[0])] = String(subSplit[1])
                   }
                
                   user.login(accessToken: dict["access_token"]!)
                   break
               case .failure(let err):
                   print(err)
                   break
               }
           }
           .prefersEphemeralWebBrowserSession(false)
    }
}

#Preview {
    Login()
}
