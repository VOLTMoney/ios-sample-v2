import SwiftUI

struct VoltSDKViewControllerWrapper: UIViewControllerRepresentable {
    
    var authToken: String
    var platformCode: String

    func handleExit(message: String) {
        print("Exit Message: \(message)")
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let controller = VoltHomeViewController(
            authToken: authToken,
            platformCode: platformCode,
            hideNavigationBar: true,
            exitCallback: handleExit
        )

        let navController = UINavigationController(rootViewController: controller)
        navController.isNavigationBarHidden = true
        
        
//        navController.modalPresentationStyle = .fullScreen
        
        
        // This ensures full-screen modal presentation

        // Create a container view
        let containerView = UIView()
        containerView.backgroundColor = .white

        
        return navController

//
//        return UIViewControllerWrapper(containerView: containerView)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

}

// Helper wrapper to return a UIViewController from a UIView
class UIViewControllerWrapper: UIViewController {
    init(containerView: UIView) {
        super.init(nibName: nil, bundle: nil)
        view = containerView
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
