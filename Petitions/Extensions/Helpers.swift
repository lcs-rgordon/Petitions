//
//  Helpers.swift
//  Helpers
//
//  Created by Russell Gordon on 2021-08-02.
//

import Foundation

extension URLSession {
    
    // Decode SOMETHING... it just needs to be Decodable... <T: Decodable>
    // Download from any URL and decode to any Decodable type
    // If you can figure out the type, do it... _ type: T.Type = T.self,
    // What URL to decode from? from url: URL,
    // "async" keyword to make function support concurrency
    func decode<T: Decodable>(
        _ type: T.Type = T.self,
        from url: URL,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        dataDecodingStrategy: JSONDecoder.DataDecodingStrategy = .deferredToData,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate
    ) async throws -> T {
        
        // Tell Swift that calling this next line of code might take some time
        // Wait for the response to come back befor we can use it
        // so, "await"
        // The line of code might throw errors
        // so, "try"
        let (data, _) = try await data(from: url)
        
        // Set up the decoder with the options the user passed in
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = keyDecodingStrategy
        decoder.dataDecodingStrategy = dataDecodingStrategy
        decoder.dateDecodingStrategy = dateDecodingStrategy
        
        // Whatever type the user asked for, decode to that
        let decoded = try decoder.decode(T.self, from: data)
        return decoded
        
    }
    
}
