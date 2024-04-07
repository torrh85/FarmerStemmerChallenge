//
//  HomeStemmerView.swift
//  FarmerStemmerChallenge
//
//  Created by HAWER TORRES on 6/04/24.
//

import SwiftUI

struct HomeStemmerView: View {
    @StateObject var viewModel: HomeStemmerViewModel
    
    init() {
        _viewModel = .init(wrappedValue: HomeStemmerViewModel())
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Please enter the word", text: $viewModel.text)
                        .font(.callout)
                        .keyboardType(.asciiCapable)
                        .padding(10)
                        .textFieldStyle(.roundedBorder)
                    Button("Analyze") {
                        viewModel.performStemming()
                    }
                    .buttonStyle(.bordered)
                }
                
                List {
                    ForEach(viewModel.items) { stem in
                        HomeStemmerRowView(stemmerItem: stem)
                    }
                }
                .listStyle(.plain)
                Spacer()
            }
            .navigationTitle("Farmer Stemmer app")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.deleteStems()
                    }, label: {
                        Image(systemName: "trash")
                    })
                }
            }
        }

        .padding()
    }
}

#Preview {
    HomeStemmerView()
}
