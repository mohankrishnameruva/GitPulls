
import SwiftUI

class PullRequestsViewModel: ObservableObject {
  @Published private(set) var prs: [PullRequest]
	var repos: [Repository]
  let username: String

  init() {
    self.prs = []
		self.repos = []
    self.username = NetworkRequest.username ?? ""
  }

  private init(
    prs: [PullRequest],
		repos: [Repository],
    username: String
  ) {
    self.prs = prs
		self.repos = repos
    self.username = username
  }

  func load() {
    NetworkRequest
      .RequestType
      .getRepos
      .networkRequest()?
      .start(responseType: [Repository].self) { [weak self] result in
        switch result {
        case .success(let networkResponse):
            self?.repos = networkResponse.object
						for repo in networkResponse.object {
							self?.getPrsForRepo(withName: repo.name)
						}
				case .failure(let error):
          print("Failed to get the user's repositories: \(error)")
        }
      }
  }
	

	
	func getPrsForRepo(withName repoName: String) {
		NetworkRequest.RequestType.getPrs(repo: repoName).networkRequest()?.start(responseType: [PullRequest].self){ [weak self] result in
			switch result {
			case .success(let networkResponse):
				self?.prs.append(contentsOf: networkResponse.object)
				print(networkResponse.object)
			case .failure(let error):
				print("Failed to get the user's Prs: \(error)")
			}
		}
	}

  func signOut() {
    NetworkRequest.signOut()
  }

  static func preview() -> PullRequestsViewModel {
    let repositories: [PullRequest] = [
//      PullRequest(id: 1, name: "First"),
//      PullRequest(id: 2, name: "Second"),
//      PullRequest(id: 3, name: "Third")
    ]
		let repos: [Repository] = []
    return PullRequestsViewModel(
      prs: repositories,
			repos: repos,
      username: "GitHub user")
  }
}
