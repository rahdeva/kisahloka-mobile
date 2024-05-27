import SwiftUI

struct AuthPageView: View {
    @StateObject private var authVM = AuthPageViewModel()
    let isUserLoggedIn : Bool
    
    var body: some View {
        NavigationView {
            if isUserLoggedIn {
                AuthenticatedScreen(authVM: authVM)
            } else {
                AuthMainScreen()
            }
        }
    }
}
