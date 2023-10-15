// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UserQuery: GraphQLQuery {
  public static let operationName: String = "User"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query User { user: Viewer { __typename id } }"#
    ))

  public init() {}

  public struct Data: Anilist.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Anilist.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Viewer", alias: "user", User?.self),
    ] }

    /// Get the currently authenticated user
    public var user: User? { __data["user"] }

    /// User
    ///
    /// Parent Type: `User`
    public struct User: Anilist.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Anilist.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
      ] }

      /// The id of the user
      public var id: Int { __data["id"] }
    }
  }
}
