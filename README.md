# Volt Framework Integration Guide

This project demonstrates the integration of the Volt Framework into a SwiftUI application. The Volt Framework provides a customizable SDK for embedding Volt's functionality into your iOS/macOS applications.

## Prerequisites

- Xcode 14.0 or later
- iOS 15.0+ / macOS 12.0+
- VoltFramework.xcframework

## Installation

1. Add the `VoltFramework.xcframework` to your Xcode project
2. Ensure the framework is properly linked in your target's "Frameworks, Libraries, and Embedded Content" section
3. Set the framework to "Embed & Sign"

## Usage

### 1. Creating a Volt Instance

To create a Volt instance, use the `VoltInstance` class with the following parameters:

```swift
let voltInstance = VoltInstance(
    voltEnv: VOLTENV.STAGING,
    partner_platform: "YOUR_PLATFORM",
    primary_color: "YOUR_PRIMARY_COLOR",
    secondary_color: "YOUR_SECONDARY_COLOR",
    ssoToken: "YOUR_SSO_TOKEN",
    customerCode: "YOUR_CUSTOMER_CODE",
    target: "",
    showSDKHeader: true/false
)

let voltSDKInstance = VoltSDKContainer(voltInstance: voltInstance)
```

### 2. Integrating the Volt SDK View

The project includes a SwiftUI wrapper (`VoltSDKViewControllerWrapper`) that makes it easy to integrate the Volt SDK into your SwiftUI views:

```swift
VoltSDKViewControllerWrapper(
    authToken: "YOUR_AUTH_TOKEN",
    platformCode: "YOUR_PLATFORM_CODE"
)
```

### 3. Launching the SDK

To launch the Volt SDK, you can use the provided wrapper in a full-screen cover:

```swift
.fullScreenCover(isPresented: $showVoltSDK) {
    VoltSDKViewControllerWrapper(
        authToken: authToken,
        platformCode: platformCode
    )
}
```

## Configuration Options

The Volt Framework supports the following configuration options:

- **Environment**: Choose between STAGING and PRODUCTION environments
- **Partner Platform**: Your platform identifier
- **Colors**: Customize primary and secondary colors
- **Authentication**: SSO Token and Auth Token support
- **Customer Code**: Your customer identifier
- **UI Options**: Toggle SDK header visibility

## Example Implementation

The project includes a complete example in `ContentView.swift` that demonstrates:

1. Creating a Volt instance with custom configuration
2. Handling authentication
3. Launching the SDK in a full-screen modal
4. Managing loading states
5. Handling user input for various configuration options

## Error Handling

The framework includes an exit callback mechanism for handling SDK exits:

```swift
func handleExit(message: String) {
    print("Exit Message: \(message)")
}
```

## Best Practices

1. Always initialize the Volt instance before attempting to launch the SDK
2. Handle loading states appropriately
3. Validate all required parameters before launching the SDK
4. Test thoroughly in both staging and production environments
5. Implement proper error handling for the exit callback

## Support

For additional support or questions about the Volt Framework, please refer to the official documentation or contact the Volt support team.

## License

This project is proprietary and confidential. Unauthorized copying or distribution is prohibited. 