//
//  RoboflowManager.swift
//  Invertebrate
//
//  Created by Hugo Padilla on 11/29/24.
//

import Foundation
import UIKit // Required for UIImage
import Roboflow

class RoboflowManager {
    let rf: RoboflowMobile
    var model: RFObjectDetectionModel?

    init(apiKey: String, modelID: String, modelVersion: Int) {
        rf = RoboflowMobile(apiKey: apiKey)
        rf.load(model: modelID, modelVersion: modelVersion) { model, error, modelName, modelType in
            if let error = error {
                print("Error loading model: \(error.localizedDescription)")
            } else {
                self.model = model
                self.model?.configure(threshold: 0.5, overlap: 0.5, maxObjects: 10)
                print("Model loaded successfully: \(modelName)")
            }
        }
    }

    func detect(image: UIImage, completion: @escaping ([Any]?, Error?) -> Void) {
        guard let model = model else {
            completion(nil, NSError(domain: "RoboflowManager", code: 1, userInfo: [NSLocalizedDescriptionKey: "Model not loaded yet."]))
            return
        }
        model.detect(image: image) { predictions, error in
            completion(predictions, error)
        }
    }
    
    func savePredictionsToFile(predictions: [String]) {
        let fileManager = FileManager.default
        if let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = documentsURL.appendingPathComponent("invertebrate_predictions.txt")
            do {
                let dataToSave = predictions.joined(separator: "\n") // Join predictions into a string
                try dataToSave.write(to: filePath, atomically: true, encoding: .utf8)
                print("Predictions successfully saved to: \(filePath.absoluteString)")
            } catch {
                print("Failed to save predictions: \(error.localizedDescription)")
            }
        }
    }

    func readPredictionsFromFile() {
        let fileManager = FileManager.default
        if let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = documentsURL.appendingPathComponent("invertebrate_predictions.txt")
            do {
                let content = try String(contentsOf: filePath, encoding: .utf8)
                print("Predictions read from file: \(content)")
            } catch {
                print("Failed to read predictions: \(error.localizedDescription)")
            }
        }
    }
}
