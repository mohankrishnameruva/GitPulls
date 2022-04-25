

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
					VStack{
						HStack {
							Text(pr.title ?? "No Title").bold().foregroundColor(Color.black)
							Spacer()
							Text(pr.state ?? "No State").foregroundColor(Color.black).bold()
																					.padding(.horizontal, 4)
																					.padding(.vertical, 4)
																					.background(statutsBackground)

						}
						HStack {
							Text(pr.body ?? "").foregroundColor(Color.black).font(Font.system(size: 12))
							Spacer()
						}
						HStack {
							Text("Assignee -  \(pr.assignee?.login ?? "")").foregroundColor(Color.black).font(Font.system(size: 12))
							Spacer()
						}
					}
        }
      }.background(Color.green)
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
	
	private var statutsBackground: some View {
		RoundedRectangle(cornerRadius: 8)
			.fill(Color.gray)
	}
}

struct PullRequestsView_Previews: PreviewProvider {
  static var previews: some View {
    PullRequestsView(
      viewModel: PullRequestsViewModel.preview(),
      displayed: .constant(true))
  }
}
