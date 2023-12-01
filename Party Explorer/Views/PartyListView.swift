//
//  PartyListView.swift
//  Party Explorer
//
//  Created by Tilak Shakya on 01/12/23.
//

import SwiftUI

struct PartyListView: View {
    @ObservedObject var viewModel = PartyViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            
            // VStack for vertical layout of the search bar and the list.
            VStack {
                TextField("Search for parties...", text: $searchText)
                    .padding(7)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                // Scrollable party card list container.
                ScrollView {
                    LazyVStack {
                        ForEach(filteredParties) { party in
                            PartyCardView(party: party)
                        }
                    }
                }
            }
            .navigationBarTitle("Party Explorer")
            .navigationBarItems(trailing: Button(action: {
                viewModel.addNewParty()
            }) {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.blue)
            })
            .background(LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.4), Color.pink.opacity(0.4)]), startPoint: .top, endPoint: .bottom))
        }
        .onAppear {
            UIScrollView.appearance().keyboardDismissMode = .onDrag
        }
    }
    
    // Computed property to filter parties based on the search text.
    private var filteredParties: [Party] {
        if searchText.isEmpty {
            return viewModel.allParties
        } else {
            return viewModel.allParties.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}


struct PartyListView_Previews: PreviewProvider {
    static var previews: some View {
        PartyListView()
    }
}
