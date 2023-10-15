// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SomeQuery: GraphQLQuery {
  public static let operationName: String = "some"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query some($page: Int!) { Page(page: $page, perPage: 10) { __typename media(type: ANIME, status: RELEASING) { __typename id coverImage { __typename medium color } title { __typename userPreferred } episodes nextAiringEpisode { __typename airingAt } } } }"#
    ))

  public var page: Int

  public init(page: Int) {
    self.page = page
  }

  public var __variables: Variables? { ["page": page] }

  public struct Data: Anilist.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Anilist.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self, arguments: [
        "page": .variable("page"),
        "perPage": 10
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
        .field("media", [Medium?]?.self, arguments: [
          "type": "ANIME",
          "status": "RELEASING"
        ]),
      ] }

      public var media: [Medium?]? { __data["media"] }

      /// Page.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: Anilist.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Anilist.Objects.Media }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("coverImage", CoverImage?.self),
          .field("title", Title?.self),
          .field("episodes", Int?.self),
          .field("nextAiringEpisode", NextAiringEpisode?.self),
        ] }

        /// The id of the media
        public var id: Int { __data["id"] }
        /// The cover images of the media
        public var coverImage: CoverImage? { __data["coverImage"] }
        /// The official titles of the media in various languages
        public var title: Title? { __data["title"] }
        /// The amount of episodes the anime has when complete
        public var episodes: Int? { __data["episodes"] }
        /// The media's next episode airing schedule
        public var nextAiringEpisode: NextAiringEpisode? { __data["nextAiringEpisode"] }

        /// Page.Medium.CoverImage
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

        /// Page.Medium.Title
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

        /// Page.Medium.NextAiringEpisode
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
