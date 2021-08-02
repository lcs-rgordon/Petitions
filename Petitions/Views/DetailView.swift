//
//  DetailView.swift
//  DetailView
//
//  Created by Russell Gordon on 2021-08-02.
//

import SwiftUI

struct DetailView: View {
    
    var petition: Petition
    
    var body: some View {
        ScrollView {
            Text(petition.title)
                .font(.title)
                .padding(.horizontal, 15)
            ProgressView(value: petition.progress, total: 1.0)
                .padding(.horizontal, 15)
            HStack {
                Text("\(petition.signatureCount) / \(petition.signatureThreshold)")
                Spacer()
            }
            .padding(.horizontal)
            Text(petition.body)
                .padding()
        }
        .navigationTitle(petition.id)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
