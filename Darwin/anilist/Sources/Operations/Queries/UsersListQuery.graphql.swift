// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UsersListQuery: GraphQLQuery {
  public static let operationName: String = "UsersList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query UsersList($id: Int) { Page(page: 0, perPage: 500) { __typename mediaList(userId: $id, type: ANIME, status: CURRENT) { __typename id progress media { __typename id title { __typename userPreferred } coverImage { __typename medium color } episodes nextAiringEpisode { __typename airingAt } status(version: 2) } } } }"#
    ))

  public var id: GraphQLNullable<Int>

  public init(id: GraphQLNullable<Int>) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: Anilist.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Anilist.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self, arguments: [
        "page": 0,
        "perPage": 500
      ]),
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: Anilist.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Anilist.Objects.Page }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("mediaList", [MediaList?]?.self, arguments: [
          "userId": .variable("id"),
          "type": "ANIME",
          "status": "CURRENT"
        ]),
      ] }

      public var mediaList: [MediaList?]? { __data["mediaList"] }

      /// Page.MediaList
      ///
      /// Parent Type: `MediaList`
      public struct MediaList: Anilist.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Anilist.Objects.MediaList }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("progress", Int?.self),
          .field("media", Media?.self),
        ] }

        /// The id of the list entry
        public var id: Int { __data["id"] }
        /// The amount of episodes/chapters consumed by the user
        public var progress: Int? { __data["progress"] }
        public var media: Media? { __data["media"] }

        /// Page.MediaList.Media
        ///
        /// Parent Type: `Media`
        public struct Media: Anilist.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Anilist.Objects.Media }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int.self),
            .field("title", Title?.self),
            .field("coverImage", CoverImage?.self),
            .field("episodes", Int?.self),
            .field("nextAiringEpisode", NextAiringEpisode?.self),
            .field("status", GraphQLEnum<Anilist.MediaStatus>?.self, arguments: ["version": 2]),
          ] }

          /// The id of the media
          public var id: Int { __data["id"] }
          /// The official titles of the media in various languages
          public var title: Title? { __data["title"] }
          /// The cover images of the media
          public var coverImage: CoverImage? { __data["coverImage"] }
          /// The amount of episodes the anime has when complete
          public var episodes: Int? { __data["episodes"] }
          /// The media's next episode airing schedule
          public var nextAiringEpisode: NextAiringEpisode? { __data["nextAiringEpisode"] }
          /// The current releasing status of the media
          public var status: GraphQLEnum<Anilist.MediaStatus>? { __data["status"] }

          /// Page.MediaList.Media.Title
          ///
          /// Parent Type: `MediaTitle`
          public struct Title: Anilist.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Anilist.Objects.MediaTitle }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("userPreferred", String?.self),
            ] }

            /// The currently authenticated users preferred title language. Default romaji for non-authenticated
            public var userPreferred: String? { __data["userPreferred"] }
          }

          /// Page.MediaList.Media.CoverImage
          ///
          /// Parent Type: `MediaCoverImage`
          public struct CoverImage: Anilist.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Anilist.Objects.MediaCoverImage }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("medium", String?.self),
              .field("color", String?.self),
            ] }

            /// The cover image url of the media at medium size
            public var medium: String? { __data["medium"] }
            /// Average #hex color of cover image
            public var color: String? { __data["color"] }
          }

          /// Page.MediaList.Media.NextAiringEpisode
          ///
          /// Parent Type: `AiringSchedule`
          public struct NextAiringEpisode: Anilist.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Anilist.Objects.AiringSchedule }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("airingAt", Int.self),
            ] }

            /// The time the episode airs at
            public var airingAt: Int { __data["airingAt"] }
          }
        }
      }
    }
  }
}
