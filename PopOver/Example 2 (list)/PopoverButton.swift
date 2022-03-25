//
//  PopoverButton.swift
//  PopOver
//
//  Created by Roberto D'Anna on 25/03/22.
//

import SwiftUI

struct PopoverButton: View {
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 18){
            
            Button(action: {
                
            }) {
                
                HStack(spacing: 15){
                    
                    Image(systemName: "house")
                        .renderingMode(.original)
                    Text("Home")
                    
                }
            }
            
            Divider()
            
            Button(action: {
                
            }) {
                
                HStack(spacing: 15){
                    
                    Image(systemName: "magnifyingglass.circle")
                        .renderingMode(.original)
                    Text("Search")
                    
                }
            }
            
            Divider()
            
            Button(action: {
                
            }) {
                
                HStack(spacing: 15){
                    
                    Image(systemName: "heart")
                        .renderingMode(.original)
                    Text("Likes")
                    
                }
            }
            
            Divider()
            
            Button(action: {
                
            }) {
                
                HStack(spacing: 15){
                    
                    Image(systemName: "person")
                        .renderingMode(.original)
                    Text("Account")
                    
                }
            }
        }
        .foregroundColor(.black)
        .frame(width: 140)
        .padding()
        .padding(.bottom, 20)
    }
}

struct PopoverButton_Previews: PreviewProvider {
    static var previews: some View {
        PopoverButton()
    }
}
