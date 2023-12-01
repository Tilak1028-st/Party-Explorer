//
//  PartyCardView.swift
//  Party Explorer
//
//  Created by Tilak Shakya on 01/12/23.
//

import SwiftUI

struct PartyCardView: View {
    var party: Party
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                
                // Load and display the party image
                AsyncImage(url: party.bannerImageURL) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
                .cornerRadius(15)
                
                // Overlay containing party details to be shown on top of the image
                VStack(alignment: .leading, spacing: 8) {
                    // Party name
                    Text(party.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    // Price and number of people going
                    HStack {
                        Text("Price: $\(party.price, specifier: "%.2f")")
                        
                        Spacer()
                        
                        Text("\(party.amountGoing) going")
                    }
                    .font(.subheadline)
                    .foregroundColor(.white)
                    
                    // Start and optional end date
                    HStack {
                        Text("Starts: \(formatDate(party.startDate))")
                        
                        Spacer()
                        
                        // Check if an end date exists and display it
                        if let endDate = party.endDate {
                            Text("Ends: \(formatDate(endDate))")
                        }
                    }
                    .font(.subheadline)
                    .foregroundColor(.white)
                }
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.7)]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(15)
            }
        }
        .shadow(radius: 10)
        .padding(.horizontal)
    }
    
    // Function to format the date into a string
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
