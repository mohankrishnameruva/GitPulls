// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pullRequests = try? newJSONDecoder().decode(PullRequests.self, from: jsonData)

import Foundation

// MARK: - PullRequest
struct PullRequest: Codable, Identifiable {
	let url: String?
	let id: Int?
	let nodeID: String?
	let htmlURL: String?
	let diffURL: String?
	let patchURL: String?
	let issueURL, commitsURL, reviewCommentsURL: String?
	let reviewCommentURL: String?
	let commentsURL, statusesURL: String?
	let number: Int?
	let state: String?
	let locked: Bool?
	let title: String?
	let user: Assignee?
	let body: String?
	let labels: [Label]?
	let milestone: Milestone?
	let activeLockReason: String?
	let createdAt, updatedAt, closedAt, mergedAt: Date?
	let mergeCommitSHA: String?
	let assignee: Assignee?
	let assignees, requestedReviewers: [Assignee]?
	let requestedTeams: [RequestedTeam]?
	let head, base: Base?
	let links: Links?
	let authorAssociation: String?
	let autoMerge: JSONNull?
	let draft: Bool?
	
	enum CodingKeys: String, CodingKey {
		case url, id
		case nodeID
		case htmlURL
		case diffURL
		case patchURL
		case issueURL
		case commitsURL
		case reviewCommentsURL
		case reviewCommentURL
		case commentsURL
		case statusesURL
		case number, state, locked, title, user, body, labels, milestone
		case activeLockReason
		case createdAt
		case updatedAt
		case closedAt
		case mergedAt
		case mergeCommitSHA
		case assignee, assignees
		case requestedReviewers
		case requestedTeams
		case head, base
		case links
		case authorAssociation
		case autoMerge
		case draft
	}
}

// MARK: - Assignee
struct Assignee: Codable {
	let login: Login?
	let id: Int?
	let nodeID: NodeID?
	let avatarURL: String?
	let gravatarID: String?
	let url, htmlURL, followersURL: String?
	let followingURL: FollowingURL?
	let gistsURL: GistsURL?
	let starredURL: StarredURL?
	let subscriptionsURL, organizationsURL, reposURL: String?
	let eventsURL: EventsURL?
	let receivedEventsURL: String?
	let type: TypeEnum?
	let siteAdmin: Bool?
	
	enum CodingKeys: String, CodingKey {
		case login, id
		case nodeID
		case avatarURL
		case gravatarID
		case url
		case htmlURL
		case followersURL
		case followingURL
		case gistsURL
		case starredURL
		case subscriptionsURL
		case organizationsURL
		case reposURL
		case eventsURL
		case receivedEventsURL
		case type
		case siteAdmin
	}
}

enum EventsURL: String, Codable {
	case httpsAPIGithubCOMUsersHubotEventsPrivacy = "https://api.github.com/users/hubot/events{/privacy}"
	case httpsAPIGithubCOMUsersOctocatEventsPrivacy = "https://api.github.com/users/octocat/events{/privacy}"
	case httpsAPIGithubCOMUsersOtherUserEventsPrivacy = "https://api.github.com/users/other_user/events{/privacy}"
}

enum FollowingURL: String, Codable {
	case httpsAPIGithubCOMUsersHubotFollowingOtherUser = "https://api.github.com/users/hubot/following{/other_user}"
	case httpsAPIGithubCOMUsersOctocatFollowingOtherUser = "https://api.github.com/users/octocat/following{/other_user}"
	case httpsAPIGithubCOMUsersOtherUserFollowingOtherUser = "https://api.github.com/users/other_user/following{/other_user}"
}

enum GistsURL: String, Codable {
	case httpsAPIGithubCOMUsersHubotGistsGistID = "https://api.github.com/users/hubot/gists{/gist_id}"
	case httpsAPIGithubCOMUsersOctocatGistsGistID = "https://api.github.com/users/octocat/gists{/gist_id}"
	case httpsAPIGithubCOMUsersOtherUserGistsGistID = "https://api.github.com/users/other_user/gists{/gist_id}"
}

enum Login: String, Codable {
	case hubot = "hubot"
	case octocat = "octocat"
	case otherUser = "other_user"
}

enum NodeID: String, Codable {
	case mdq6VXNlcjE = "MDQ6VXNlcjE="
}

enum StarredURL: String, Codable {
	case httpsAPIGithubCOMUsersHubotStarredOwnerRepo = "https://api.github.com/users/hubot/starred{/owner}{/repo}"
	case httpsAPIGithubCOMUsersOctocatStarredOwnerRepo = "https://api.github.com/users/octocat/starred{/owner}{/repo}"
	case httpsAPIGithubCOMUsersOtherUserStarredOwnerRepo = "https://api.github.com/users/other_user/starred{/owner}{/repo}"
}

enum TypeEnum: String, Codable {
	case user = "User"
}

// MARK: - Base
struct Base: Codable {
	let label, ref, sha: String?
	let user: Assignee?
	let repo: Repo?
}

// MARK: - Repo
struct Repo: Codable {
	let id: Int?
	let nodeID, name, fullName: String?
	let owner: Assignee?
	let repoPrivate: Bool?
	let htmlURL: String?
	let repoDescription: String?
	let fork: Bool?
	let url: String?
	let archiveURL, assigneesURL, blobsURL, branchesURL: String?
	let collaboratorsURL, commentsURL, commitsURL, compareURL: String?
	let contentsURL: String?
	let contributorsURL, deploymentsURL, downloadsURL, eventsURL: String?
	let forksURL: String?
	let gitCommitsURL, gitRefsURL, gitTagsURL, gitURL: String?
	let issueCommentURL, issueEventsURL, issuesURL, keysURL: String?
	let labelsURL: String?
	let languagesURL, mergesURL: String?
	let milestonesURL, notificationsURL, pullsURL, releasesURL: String?
	let sshURL: String?
	let stargazersURL: String?
	let statusesURL: String?
	let subscribersURL, subscriptionURL, tagsURL, teamsURL: String?
	let treesURL: String?
	let cloneURL: String?
	let mirrorURL: String?
	let hooksURL, svnURL, homepage: String?
	let language: JSONNull?
	let forksCount, stargazersCount, watchersCount, size: Int?
	let defaultBranch: String?
	let openIssuesCount: Int?
	let isTemplate: Bool?
	let topics: [String]?
	let hasIssues, hasProjects, hasWiki, hasPages: Bool?
	let hasDownloads, archived, disabled: Bool?
	let visibility: String?
	let pushedAt, createdAt, updatedAt: Date?
	let permissions: Permissions?
	let allowRebaseMerge: Bool?
	let templateRepository: JSONNull?
	let tempCloneToken: String?
	let allowSquashMerge, allowAutoMerge, deleteBranchOnMerge, allowMergeCommit: Bool?
	let subscribersCount, networkCount: Int?
	let license: License?
	let forks, openIssues, watchers: Int?
	
	enum CodingKeys: String, CodingKey {
		case id
		case nodeID
		case name
		case fullName
		case owner
		case repoPrivate
		case htmlURL
		case repoDescription
		case fork, url
		case archiveURL
		case assigneesURL
		case blobsURL
		case branchesURL
		case collaboratorsURL
		case commentsURL
		case commitsURL
		case compareURL
		case contentsURL
		case contributorsURL
		case deploymentsURL
		case downloadsURL
		case eventsURL
		case forksURL
		case gitCommitsURL
		case gitRefsURL
		case gitTagsURL
		case gitURL
		case issueCommentURL
		case issueEventsURL
		case issuesURL
		case keysURL
		case labelsURL
		case languagesURL
		case mergesURL
		case milestonesURL
		case notificationsURL
		case pullsURL
		case releasesURL
		case sshURL
		case stargazersURL
		case statusesURL
		case subscribersURL
		case subscriptionURL
		case tagsURL
		case teamsURL
		case treesURL
		case cloneURL
		case mirrorURL
		case hooksURL
		case svnURL
		case homepage, language
		case forksCount
		case stargazersCount
		case watchersCount
		case size
		case defaultBranch
		case openIssuesCount
		case isTemplate
		case topics
		case hasIssues
		case hasProjects
		case hasWiki
		case hasPages
		case hasDownloads
		case archived, disabled, visibility
		case pushedAt
		case createdAt
		case updatedAt
		case permissions
		case allowRebaseMerge
		case templateRepository
		case tempCloneToken
		case allowSquashMerge
		case allowAutoMerge
		case deleteBranchOnMerge
		case allowMergeCommit
		case subscribersCount
		case networkCount
		case license, forks
		case openIssues
		case watchers
	}
}

// MARK: - License
struct License: Codable {
	let key, name: String?
	let url: String?
	let spdxID, nodeID: String?
	let htmlURL: String?
	
	enum CodingKeys: String, CodingKey {
		case key, name, url
		case spdxID
		case nodeID
		case htmlURL
	}
}

// MARK: - Permissions
struct Permissions: Codable {
	let admin, push, pull: Bool?
}

// MARK: - Label
struct Label: Codable {
	let id: Int?
	let nodeID: String?
	let url: String?
	let name, labelDescription, color: String?
	let labelDefault: Bool?
	
	enum CodingKeys: String, CodingKey {
		case id
		case nodeID
		case url, name
		case labelDescription
		case color
		case labelDefault
	}
}

// MARK: - Links
struct Links: Codable {
	let linksSelf, html, issue, comments: Comments?
	let reviewComments, reviewComment, commits, statuses: Comments?
	
	enum CodingKeys: String, CodingKey {
		case linksSelf
		case html, issue, comments
		case reviewComments
		case reviewComment
		case commits, statuses
	}
}

// MARK: - Comments
struct Comments: Codable {
	let href: String?
}

// MARK: - Milestone
struct Milestone: Codable {
	let url: String?
	let htmlURL: String?
	let labelsURL: String?
	let id: Int?
	let nodeID: String?
	let number: Int?
	let state, title, milestoneDescription: String?
	let creator: Assignee?
	let openIssues, closedIssues: Int?
	let createdAt, updatedAt, closedAt, dueOn: Date?
	
	enum CodingKeys: String, CodingKey {
		case url
		case htmlURL
		case labelsURL
		case id
		case nodeID
		case number, state, title
		case milestoneDescription
		case creator
		case openIssues
		case closedIssues
		case createdAt
		case updatedAt
		case closedAt
		case dueOn
	}
}

// MARK: - RequestedTeam
struct RequestedTeam: Codable {
	let id: Int?
	let nodeID: String?
	let url, htmlURL: String?
	let name, slug, requestedTeamDescription, privacy: String?
	let permission, membersURL: String?
	let repositoriesURL: String?
	let parent: JSONNull?
	
	enum CodingKeys: String, CodingKey {
		case id
		case nodeID
		case url
		case htmlURL
		case name, slug
		case requestedTeamDescription
		case privacy, permission
		case membersURL
		case repositoriesURL
		case parent
	}
}

typealias PullRequests = [PullRequest]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
	
	public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
		return true
	}
	
	public var hashValue: Int {
		return 0
	}
	
	public func hash(into hasher: inout Hasher) {
		// No-op
	}
	
	public init() {}
	
	public required init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if !container.decodeNil() {
			throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
		}
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encodeNil()
	}
}

