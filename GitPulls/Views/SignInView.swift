
import SwiftUI

struct SignInView: View {
  @ObservedObject private var viewModel = SignInViewModel()

  var body: some View {
    NavigationView {
      VStack(spacing: 30) {
        NavigationLink(
          destination: PullRequestsView(displayed: $viewModel.showingPullRequestsView),
          isActive: $viewModel.showingPullRequestsView
        ) { EmptyView() }


        if viewModel.isLoading {
          ProgressView()
        } else {
          Button(action: { viewModel.signInTapped() }, label: {
            Text("Sign In")
              .font(Font.system(size: 24).weight(.semibold))
							.foregroundColor(Color.white)
              .padding(.horizontal, 50)
              .padding(.vertical, 8)
          })
          .background(buttonBackground)
        }
      }
      .navigationBarHidden(true)
      .onAppear {
        viewModel.appeared()
      }
    }
  }

  private var buttonBackground: some View {
    RoundedRectangle(cornerRadius: 8)
			.fill(Color.black)
  }
}

struct SignInView_Previews: PreviewProvider {
  static var previews: some View {
    SignInView()
  }
}
