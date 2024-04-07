//
//  HomeStemmerRowView.swift
//  FarmerStemmerChallenge
//
//  Created by HAWER TORRES on 6/04/24.
//

import SwiftUI

struct HomeStemmerRowView: View {
    let stemmerItem: StemmerItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                wordView
                stemView
            }
            Spacer()
            countView
        }
    }
    
    private var wordView: some View {
        HStack {
            Text("Word: ")
                .font(.headline)
                .fontWeight(.bold)
            Text(stemmerItem.word)
                .font(.callout)
                .fontWeight(.regular)
        }
    }
    
    private var stemView: some View {
        HStack {
            Text("Stem: ")
                .font(.headline)
                .fontWeight(.bold)
            Text(stemmerItem.text)
                .font(.callout)
                .fontWeight(.regular)
        }
    }

    private var countView: some View {
        Text("\(stemmerItem.count)")
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
    }
}

#Preview {
    HomeStemmerRowView(stemmerItem: StemmerItem(text: "wewewe", word: "sdsdfsdf", count: 2, timestamp: 933434))
}
