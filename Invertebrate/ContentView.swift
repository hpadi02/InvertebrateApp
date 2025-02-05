//
//  ContentView.swift
//  Invertebrate
//
//  Created by Hugo Padilla on 11/29/24.
//

import SwiftUI
import Roboflow




struct ContentView: View {
    // Initialize the RoboflowManager with your API Key, Model ID, and Model Version
    let roboflowManager = RoboflowManager(apiKey: "aMhcpI1e6msiS94zGuoZ", modelID: "aquatic-invertebrates-hz5po", modelVersion:1)

    @State private var predictions: [Any]? = nil // Holds the predictions from Roboflow
    @State private var errorMessage: String? = nil // Holds error messages if inference fails

    var body: some View {
        VStack {
            // Display predictions or error messages
            if let predictions = predictions {
                Text("Predictions: \(predictions.description)")
                    .padding()
            } else if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            } else {
                Text("Press the button to run inference.")
                    .padding()
            }

            // Button to trigger inference
            Button(action: runInference) {
                Text("Run Inference")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }

    // Function to run Roboflow inference
    func runInference() {
        if let img = UIImage(named: "example.jpeg") { // Replace with your image name
            roboflowManager.detect(image: img) { predictions, error in
                if let error = error {
                    self.errorMessage = error.localizedDescription
                } else {
                    self.predictions = predictions
                }
            }
        } else {
            self.errorMessage = "Image not found in assets."
        }
    }
}

#Preview {
    ContentView()
}
