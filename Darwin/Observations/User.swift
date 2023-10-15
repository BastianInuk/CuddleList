import Observation
import SwiftUI
import KeychainAccess

@Observable
class User {
    let keychain = Keychain(service: "dk.manga.fstlist")
    private(set) var accessToken: Optional<String>
    
    init() {
        self.accessToken = keychain["access_token"]
    }
    
    func login(accessToken: String) {
        keychain["access_token"] = accessToken
        self.accessToken = accessToken
    }
    
    func logout() {
        keychain["access_token"] = nil
        accessToken = nil
    }
}

extension User: EnvironmentKey {
    static var defaultValue: User {
        .init()
    }
    
    typealias Value = User
}

extension EnvironmentValues {
    var user: User {
        get { self[User.self] }
        set { self[User.self] = newValue }
    }
}
