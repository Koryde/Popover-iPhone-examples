//
//  MainView2.swift
//  PopOver
//
//  Created by Roberto D'Anna on 25/03/22.
//

import SwiftUI

struct MainView2: View {
    
    @State var show = false
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing, content: {
            VStack{
                
                HStack{
                    
                    Text("Example 2")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(.top, 60)
                .padding([.horizontal, .bottom])
                .background(Color.orange)
                
                Spacer()
                
            }
            
            VStack(alignment: .center, spacing: 15){
                
                if self.show{
                    
                    PopoverButton()
                        .background(Color.white)
                        .clipShape(Ex2ArrowShape())
                        .cornerRadius(15)
                        .offset(y: 15)
                    
                }
                Button(action: {
                    
                    withAnimation(.spring()){
                        
                        self.show.toggle()
                    }
                    
                }) {
                    Image(systemName: self.show ? "xmark" : "arrow.up")
                        .resizable()
                        .frame(width: 20, height: 22)
                        .foregroundColor(.orange)
                        .padding()
                }
                .background(Color.white)
                .clipShape(Circle())
            }
            .padding()
            
        })
            .edgesIgnoringSafeArea(.top)
            .background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.all))
    }
}
struct MainView2_Previews: PreviewProvider {
    static var previews: some View {
        MainView2()
    }
}
