

import SwiftUI

struct PullRequestsView: View {
  @ObservedObject private var viewModel = PullRequestsViewModel()
  @Binding private var displayed: Bool

  init(
    viewModel: PullRequestsViewModel = PullRequestsViewModel(),
    displayed: Binding<Bool>
  ) {
    self.viewModel = viewModel
    self._displayed = displayed
  }

  var body: some View {
    VStack {
      Text(viewModel.username)
        .font(.system(size: 20))
        .fontWeight(.semibold)
        .padding()
      List {
        ForEach(viewModel.prs) { pr in
					Text(pr.title ?? "No Title")
        }
      }
    }
    .navigationBarTitle("Your Pull Requests", displayMode: .inline)
    .navigationBarItems(leading: signOutButton)
    .navigationBarBackButtonHidden(true)
    .onAppear {
      viewModel.load()
    }
  }

  private var signOutButton: some View {
    Button("Sign Out") {
      viewModel.signOut()
      displayed = false
    }
  }
}

struct PullRequestsView_Previews: PreviewProvider {
  static var previews: some View {
    PullRequestsView(
      viewModel: PullRequestsViewModel.preview(),
      displayed: .constant(true))
  }
}
