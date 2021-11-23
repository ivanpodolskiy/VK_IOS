//
//  NewFeedModel.swift
//  LessonOne
//
//  Created by user on 19.11.2021.
//
//   let newJSON = try? newJSONDecoder().decode(NewJSON.self, from: jsonData)

import Foundation



// MARK: - NewJSON
struct NewJSON: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let items: [Item]
    let groups: [NewGroup]
    let profiles: [Profile]
    let nextFrom: String

    enum CodingKeys: String, CodingKey {
        case items, groups, profiles
        case nextFrom = "next_from"
    }
}

// MARK: - Group
struct NewGroup: Codable {
    let isMember, id: Int
    let photo100: String
    let isAdvertiser, isAdmin: Int
    let photo50, photo200: String
    let type, screenName, name: String
    let isClosed: Int

    enum CodingKeys: String, CodingKey {
        case isMember = "is_member"
        case id
        case photo100 = "photo_100"
        case isAdvertiser = "is_advertiser"
        case isAdmin = "is_admin"
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case type
        case screenName = "screen_name"
        case name
        case isClosed = "is_closed"
    }
}

// MARK: - ResponseItem
struct Item: Codable {
    let photos: Photos?
    let postID, sourceID: Int
    let type: String
    let date: Int
//    let comments: Comments?
    let canSetCategory: Bool?
    let likes: PurpleLikes?
    let reposts: Reposts?
    let postType, text: String?
    let canDoubtCategory: Bool?
    let attachments: [Attachment]?
    let markedAsAds: Int?
    let postSource: PostSource?
    let views: Views?

    enum CodingKeys: String, CodingKey {
        case photos
        case postID = "post_id"
        case sourceID = "source_id"
        case type, date
//        case comments
        case canSetCategory = "can_set_category"
        case likes, reposts
        case postType = "post_type"
        case text
        case canDoubtCategory = "can_doubt_category"
        case attachments
        case markedAsAds = "marked_as_ads"
        case postSource = "post_source"
        case views
    }
}

// MARK: - Attachment
struct Attachment: Codable {
    let type: String
    let photo: Photo
}

// MARK: - Photo
struct Photo: Codable {
    let albumID, id, date: Int
    let text: String
    let sizes: [Size]
    let hasTags: Bool
    let ownerID: Int
    let accessKey: String
    let userID: Int?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id, date, text, sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case accessKey = "access_key"
        case userID = "user_id"
    }
}

// MARK: - Size
struct Size: Codable {
    let width, height: Int
    let url: String
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case m = "m"
    case o = "o"
    case p = "p"
    case q = "q"
    case r = "r"
    case s = "s"
    case w = "w"
    case x = "x"
    case y = "y"
    case z = "z"
}

// MARK: - Comments
//struct Comments: Codable {
//    let count, canPost: Int
//    let groupsCanPost: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case count
//        case canPost = "can_post"
//        case groupsCanPost = "groups_can_post"
//    }
//}

// MARK: - PurpleLikes
struct PurpleLikes: Codable {
    let canLike, canPublish, count, userLikes: Int

    enum CodingKeys: String, CodingKey {
        case canLike = "can_like"
        case canPublish = "can_publish"
        case count
        case userLikes = "user_likes"
    }
}

// MARK: - Photos
struct Photos: Codable {
    let count: Int
    let items: [PhotosItem]
}

// MARK: - PhotosItem
struct PhotosItem: Codable {
    let id: Int
    let comments: Views
    let likes: FluffyLikes
    let accessKey: String
    let userID: Int
    let reposts: Reposts
    let date, ownerID: Int
    let text: String
    let canRepost: Int
    let sizes: [Size]
    let hasTags: Bool
    let albumID, canComment: Int

    enum CodingKeys: String, CodingKey {
        case id, comments, likes
        case accessKey = "access_key"
        case userID = "user_id"
        case reposts, date
        case ownerID = "owner_id"
        case text
        case canRepost = "can_repost"
        case sizes
        case hasTags = "has_tags"
        case albumID = "album_id"
        case canComment = "can_comment"
    }
}

// MARK: - Views
struct Views: Codable {
    let count: Int
}

// MARK: - FluffyLikes
struct FluffyLikes: Codable {
    let userLikes, count: Int

    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}

// MARK: - Reposts
struct Reposts: Codable {
    let count, userReposted: Int

    enum CodingKeys: String, CodingKey {
        case count
        case userReposted = "user_reposted"
    }
}

// MARK: - PostSource
struct PostSource: Codable {
    let platform, type: String
}

// MARK: - Profile
struct Profile: Codable {
    let online, id: Int
    let photo100: String
    let lastName: String
    let photo50: String
    let onlineInfo: OnlineInfo
    let sex: Int
    let screenName, firstName: String
    let onlineApp, onlineMobile: Int?

    enum CodingKeys: String, CodingKey {
        case online, id
        case photo100 = "photo_100"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case onlineInfo = "online_info"
        case sex
        case screenName = "screen_name"
        case firstName = "first_name"
        case onlineApp = "online_app"
        case onlineMobile = "online_mobile"
    }
}

// MARK: - OnlineInfo
struct OnlineInfo: Codable {
    let visible, isMobile, isOnline: Bool
    let appID, lastSeen: Int?

    enum CodingKeys: String, CodingKey {
        case visible
        case isMobile = "is_mobile"
        case isOnline = "is_online"
        case appID = "app_id"
        case lastSeen = "last_seen"
    }
}

