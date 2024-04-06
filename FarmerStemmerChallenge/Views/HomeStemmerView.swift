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
                    TextField("Word", text: $viewModel.text)
                        .textFieldStyle(.roundedBorder)
                    Button("Stem") {
                        viewModel.performStemming()
                    }
                }
                
                List {
                    ForEach(viewModel.items) { stem in
                        Text("\(stem.text), \(stem.count)")
                    }
                }
                .listStyle(.plain)
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        viewModel.deleteStems()
                    }, label: {
                        Text("Delete")
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
