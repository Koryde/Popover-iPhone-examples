//
//  GraphicalCustom.swift
//  PopOver
//
//  Created by Roberto D'Anna on 25/03/22.
//

import SwiftUI

extension View {
    
    @ViewBuilder func applyTextColor(_ color: Color) -> some View{
        
        if UITraitCollection.current.userInterfaceStyle == .light {
            
            self.colorInvert().colorMultiply(color)
            
        } else{
            
            self.colorMultiply(color)
            
        }
    }
}
