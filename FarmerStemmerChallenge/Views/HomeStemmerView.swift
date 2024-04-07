//
//  HomeStemmerView.swift
//  FarmerStemmerChallenge
//
//  Created by HAWER TORRES on 6/04/24.
//

import SwiftUI

struct HomeStemmerView: View {
    // MARK: - Property Wrappers
    @StateObject var viewModel: HomeStemmerViewModel
    
    init() {
        _viewModel = .init(wrappedValue: HomeStemmerViewModel())
    }
    
    // MARK: - Views
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Please enter the word", text: $viewModel.text)
                        .font(.callout)
                        .keyboardType(.asciiCapable)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                    Button("Analyze") {
                        viewModel.performStemming()
                    }
                    .buttonStyle(.bordered)
                }
                
                List {
                    Section {
                        ForEach(viewModel.items) { stem in
                            HomeStemmerRowView(stemmerItem: stem)
                        }
                    } header: {
                        headerView
                    }
                }
                .listStyle(.plain)
                Spacer()
            }
            .navigationTitle("Farmer Stemmer")
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
    
    private var headerView: some View {
        HStack {
            Text("TOTAL")
                .lineLimit(1)
                .bold()
                .font(.headline)
            Spacer()
            Text("\(viewModel.totalStemWords)")
                .padding()
                .background(Color.indigo)
                .foregroundColor(.white)
                .clipShape(Circle())
        }
    }
}

#Preview {
    HomeStemmerView()
}
