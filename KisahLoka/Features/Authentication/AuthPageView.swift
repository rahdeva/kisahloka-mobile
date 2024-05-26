import SwiftUI

struct AuthPageView: View {
    @StateObject private var authManager = AuthManager()
    @StateObject private var authVM = AuthPageViewModel()
    
    var body: some View {
        NavigationView {
            if authManager.isUserLoggedIn {
                AuthenticatedScreen(authVM: authVM)
                    .environmentObject(authManager)
            } else {
                AuthMainScreen()
                    .environmentObject(authManager)
            }
        }
    }
}

#Preview {
    AuthPageView()
}
