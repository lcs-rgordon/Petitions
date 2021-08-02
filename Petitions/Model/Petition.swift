//
//  Petition.swift
//  Petition
//
//  Created by Russell Gordon on 2021-08-02.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let petition = try? newJSONDecoder().decode(Petition.self, from: jsonData)

import Foundation

// MARK: - Petition
struct Petition: Codable, Identifiable {
    let id: String
    let title: String
    let type: String
    let body: String
    let signatureThreshold: Int
    let signatureCount: Int
    var progress: Double {
        let progress = Double(signatureCount) / Double(signatureThreshold)
        if progress > 1.0 {
            return 1.0
        } else {
            return progress
        }
    }
}
