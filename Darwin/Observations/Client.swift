import Observation
import Foundation
import Apollo
import ApolloAPI
import Anilist
import SwiftData

typealias Medium = Anilist.AllQuery.Data.Page.Medium
typealias UserAnime = UsersListQuery.Data.Page.MediaList

@Observable
class AnilistClient {
    private let apolloClient: ApolloClient
    
    init(token: String) {
        guard let queryURL = URL(string: "https://graphql.anilist.co") else {
            fatalError("This should never happen!")
        }
        
        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: DefaultInterceptorProvider(store: .init()),
            endpointURL: queryURL,
            additionalHeaders: ["Authorization" : "Bearer \(token)"]
        )
        
        self.apolloClient = ApolloClient(networkTransport: networkTransport, store: .init())
    }
    
    func allAnime() async throws -> AllQuery.Data? {
        let data = switch await self.apolloClient.fetch(query: AllQuery()) {
        case .success(let data):
            data.data

        case .failure(let error):
            throw error
        }
        
        return data
    }
    
    func userAnime() async throws -> [UserAnime] {
        let userId = try await userId()
        
        switch await apolloClient.fetch(query: UsersListQuery(id: GraphQLNullable<Int>(integerLiteral: userId))) {
        case .success(let result):
            return result.data?.page?.mediaList?
                .compactMap { $0 } ?? []
        case .failure(let err):
            throw err
        }
        
    }
    
    func userId() async throws -> Int {
        let userId = switch await apolloClient.fetch(query: UserQuery())
            .map(\.data?.user?.id) {
        case .success(let id):
            id
        case .failure(let error):
            throw error
        }
        
        guard let userId else { throw UserListError.noId }
        return userId
    }
}

enum UserListError : Error {
    case noId
}

private extension ApolloClient {
    func fetch<Query: GraphQLQuery>(query: Query,
                                    cachePolicy: CachePolicy = .default,
                                    contextIdentifier: UUID? = nil,
                                    context: RequestContext? = nil,
                                    queue: DispatchQueue = .main) async -> Result<GraphQLResult<Query.Data>, Error> {
        await withCheckedContinuation { checkedContinuation in
            self.fetch(query: query, cachePolicy: cachePolicy, contextIdentifier: contextIdentifier, context: context, queue: queue) { result in
                checkedContinuation.resume(returning: result)
            }
        }
    }
}

