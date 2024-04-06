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
        VStack {
            HStack {
                TextField("Word", text: $viewModel.text)
                    .textFieldStyle(.roundedBorder)
                Button("Stem") {
                    viewModel.stemming()
                }
            }
            
            List {
                ForEach(viewModel.stemWords, id: \.self) { word in
                    Text("\(word)")
                }
            }
            Spacer()
        }
    }
}

#Preview {
    HomeStemmerView()
}
