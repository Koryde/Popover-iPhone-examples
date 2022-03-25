//
//  Popover.swift
//  PopOver
//
//  Created by Roberto D'Anna on 24/03/22.
//

import SwiftUI

//Creating Extension for popover
extension View{
    
    func toolBarPopover<Content: View>(show: Binding<Bool>,placement: Placement = .leading, @ViewBuilder content: @escaping ()->Content)->some View{
        
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack{
                    if show.wrappedValue{
                        content()
                            .padding()
                            .background(
                                Color.white
                                    .clipShape(Ex1ArrowShape(placement: placement))
                            )
                        
//                        Shadows
                            .shadow(color: Color.primary.opacity(0.05), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.primary.opacity(0.05), radius: 5, x: -5, y: -5)
                            .padding(.horizontal,35)
                        
//                        Moving from top
//                        Approx top Navigation Bar height
                            .offset(y: 55)
                            .offset(x: placement == .leading ? -20 : 20)
                    }
                },
                alignment: placement == .leading ? .topLeading : .topTrailing)
    }
}



struct Popover_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
