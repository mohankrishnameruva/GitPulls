// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pullRequests = try? newJSONDecoder().decode(PullRequests.self, from: jsonData)

import Foundation

// MARK: - PullRequest
struct PullRequest: Codable, Identifiable {
	let url: String?
	let id: Int?
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
	let body: String?
	let activeLockReason: String?
	let createdAt, updatedAt, closedAt, mergedAt: Date?
	let mergeCommitSHA: String?
	let authorAssociation: String?
	let assignee: Assignee?
	let assignees, requestedReviewers: [Assignee]?
	
	enum CodingKeys: String, CodingKey {
		case url, id
		case htmlURL
		case diffURL
		case patchURL
		case issueURL
		case commitsURL
		case reviewCommentsURL
		case reviewCommentURL
		case commentsURL
		case statusesURL
		case number, state, locked, title, body
		case activeLockReason
		case createdAt
		case updatedAt
		case closedAt
		case mergedAt
		case mergeCommitSHA
		case authorAssociation
		case assignee, assignees
		case requestedReviewers
	}
}
struct Assignee: Codable {
	let id: Int?
	let login: String?
	let avatarURL: String?
	let gravatarID: String?
	let url, htmlURL, followersURL: String?
	let subscriptionsURL, organizationsURL, reposURL: String?
	let receivedEventsURL: String?
	let siteAdmin: Bool?
	
	enum CodingKeys: String, CodingKey {
		case id
		case login
		case avatarURL
		case gravatarID
		case url
		case htmlURL
		case followersURL
		case subscriptionsURL
		case organizationsURL
		case reposURL
		case receivedEventsURL
		case siteAdmin
	}
}
