# Roboflow iOS App

This repository contains an iOS application that utilizes the [Roboflow Mobile iOS SDK](https://docs.roboflow.com/deploy/sdks/mobile-ios-on-device) to deploy a machine learning model for on-device inference.

## Features
- Deploys a trained Roboflow model on an iOS device
- Supports real-time and static image classification/detection
- Utilizes the Roboflow Mobile iOS SDK for optimized performance
- Includes a user-friendly interface for capturing and processing images

## Installation
### Prerequisites
Ensure you have the following installed:
- macOS with Xcode (latest version recommended)
- CocoaPods or Swift Package Manager (SPM)
- An Apple Developer Account (for device deployment)

### Steps
1. Clone this repository:
   ```sh
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name
   ```
2. Install dependencies via CocoaPods:
   ```sh
   pod install
   ```
   Or if using Swift Package Manager (SPM), add the Roboflow SDK as a dependency in your `Package.swift` file.
3. Open the project in Xcode:
   ```sh
   open your-project.xcworkspace
   ```
4. Configure your Roboflow API key in the app.
5. Build and run the app on a physical iOS device.

## Usage
1. Open the app and grant camera permissions.
2. Capture or upload an image.
3. The model processes the image and displays predictions.

## Configuration
Update the following in your app:
- **Roboflow API Key:** Set your API key in `AppConfig.swift`.
- **Model Details:** Specify your model name and version.

## Troubleshooting
- If you encounter issues with dependencies, ensure CocoaPods or SPM is up to date.
- Verify that the correct API key and model name are set.
- Ensure that your device is running iOS 14.0 or later.
- 
