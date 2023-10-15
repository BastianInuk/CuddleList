// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == Anilist.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == Anilist.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == Anilist.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == Anilist.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return Anilist.Objects.Query
    case "User": return Anilist.Objects.User
    case "Page": return Anilist.Objects.Page
    case "MediaList": return Anilist.Objects.MediaList
    case "Media": return Anilist.Objects.Media
    case "MediaTitle": return Anilist.Objects.MediaTitle
    case "MediaCoverImage": return Anilist.Objects.MediaCoverImage
    case "AiringSchedule": return Anilist.Objects.AiringSchedule
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
