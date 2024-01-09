//
//  DestinationSearchView.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 9.1.24..
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    
    var body: some View {
        VStack {
            Button {
                withAnimation(.snappy){
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
            
            //MARK: - 3 collapsble views
            
            //MARK: top: where to?
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destination", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPick(title: "Where", desc: "Add destination")
                }
            }
            .padding()
            .frame(height: selectedOption == .location ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .location }
            }
            
            //MARK: middle: date select
            VStack {
                if selectedOption == .dates {
                    HStack {
                        Text("Show expanded view")
                        
                        Spacer()
                    }
                } else {
                    CollapsedPick(title: "When", desc: "Add dates")
                }
            }
            .padding()
            .frame(height: selectedOption == .dates ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .dates }
            }
            
            //MARK: bottom: number of guests
            VStack {
                if selectedOption == .guests {
                    HStack {
                        Text("Show expanded view")
                        
                        Spacer()
                    }
                } else {
                    CollapsedPick(title: "Who", desc: "Add guests")
                }
            }
            .padding()
            .frame(height: selectedOption == .guests ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .guests }
            }
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

//MARK: CollapsedPick Extracted View
struct CollapsedPick: View {
    
    let title:String
    let desc:String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(desc)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
