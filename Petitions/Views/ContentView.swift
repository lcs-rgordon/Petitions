//
//  ContentView.swift
//  Petitions
//
//  Created by Russell Gordon on 2021-08-02.
//

import SwiftUI


struct ContentView: View {
    
    @State private var petitions = [Petition]()
    
    var body: some View {
        NavigationView {
            List(petitions) { petition in
                NavigationLink(destination: DetailView(petition: petition)) {
                    HStack {
                        ProgressView(value: petition.progress, total: 1.0)
                            .progressViewStyle(GaugeProgressStyle())
                            .frame(width: 75, height: 75)
                            .padding(5)
                        VStack(alignment: .leading) {
                            Text("**\(petition.id)**")
                            Text("\(petition.title)")
                            Spacer()
                        }
                    }
                    
                }
            }
            .navigationTitle("Petitions")
        }
        .task {
            do {
                petitions = try await getPetitions()
            } catch DecodingError.keyNotFound(let key, let context) {
                fatalError("Failed to decode due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
            } catch DecodingError.typeMismatch(let key, let context) {
                fatalError("Failed to decode due to type mismatch on key \(key) – \(context.debugDescription)")
            } catch DecodingError.valueNotFound(let type, let context) {
                fatalError("Failed to decode due to missing \(type) value – \(context.debugDescription)")
            } catch DecodingError.dataCorrupted(_) {
                fatalError("Failed to decode because it appears to be invalid JSON")
            } catch {
                fatalError("Failed to decode: \(error.localizedDescription)")
            }
        }
    }
    
    // Get the petitions data
    func getPetitions() async throws -> [Petition] {
        let petitionsURL = URL(string: "https://www.hackingwithswift.com/samples/petitions.json")!
        return try await URLSession.shared.decode(from: petitionsURL)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
