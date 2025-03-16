import SwiftUI
import WebKit

struct ContentView: View {
    
    @State private var showVoltSDK = false  // Control when to show Volt SDK
    @State private var isLoading = false   // Loading state
    @State private var showWebView = false // Control when to show WebView

    // Input fields with default values
    @State private var primaryColor: String = ""
    @State private var secondaryColor: String = ""
    @State private var partnerPlatform: String = "VOLT_API_UAT"
    @State private var authToken: String = ""
    @State private var platformCode: String = "VOLT_API_UAT"
    @State private var ssoToken: String = ""
    @State private var customerCode: String = ""
    @State private var isChecked: Bool = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                Text("Hello, world!")
                    .font(.title)
                
                // Input Fields
                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        Text("Primary Color")
                        TextField("Enter Primary Color", text: $primaryColor)
                        
                        Text("Secondary Color")
                        TextField("Enter Secondary Color", text: $secondaryColor)
                        
                        Text("Partner Platform")
                        TextField("Enter Partner Platform", text: $partnerPlatform)
                        
                        Text("SSO Token")
                        TextField("Enter Partner Platform", text: $ssoToken)
                        
                        Text("Customer Code")
                        TextField("Enter Partner Platform", text: $customerCode)
                        Toggle(isOn: $isChecked) {
                                        Text("Show Header")  // Label text
                                            .font(.headline)
                                    }
                                    .padding()
//
                    }
                    
                    Divider().padding(.vertical, 10)
                    
                    Button("Create Volt Instance") {
                        createVoltInstance()
                    }
                    
                    Group {
                        Text("Auth Token")
                        TextField("Enter Auth Token", text: $authToken)
                        
                        Text("Platform Code")
                        TextField("Enter Platform Code", text: $platformCode)
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

                // Launch SDK Button
                Button("Launch SDK") {
                    launchVoltSDK()
                }
                .buttonStyle(.borderedProminent)
                .disabled(isLoading) // Disable button while loading

                
                // Loader
                if isLoading {
                    ProgressView("Loading...")
                        .padding()
                }
            }
            .padding()
            .background(Color.white)
        }
        .fullScreenCover(isPresented: $showVoltSDK) {
            VoltSDKViewControllerWrapper(
                authToken: authToken,
                platformCode: platformCode
            )
        }
        

    }
    
    func launchVoltSDK() {
        isLoading = true
        
        // Simulate loading delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            showVoltSDK = true
        }
    }
    
    func createVoltInstance() {

        let voltInstance = VoltInstance(voltEnv : VOLTENV.STAGING,partner_platform: partnerPlatform, primary_color: primaryColor, secondary_color: secondaryColor, ssoToken: ssoToken , target: "" ,showSDKHeader: isChecked)

        let voltSDKInstance = VoltSDKContainer(voltInstance: voltInstance)

        print("Volt Instance Created:" , voltSDKInstance)
    }
}

// WebView Wrapper
struct WebView: UIViewRepresentable {
    let url: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: url) {
            webView.load(URLRequest(url: url))
        }
        webView.isInspectable = true;
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

#Preview {
    ContentView()
}
