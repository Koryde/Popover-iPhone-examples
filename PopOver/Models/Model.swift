//
//  Model.swift
//  PopOver
//
//  Created by Roberto D'Anna on 25/03/22.
//
import SwiftUI

//Placement
enum Placement{
    case leading
    case trailing
}

//Custom Arrow Shape
struct Ex1ArrowShape: Shape{
    
    var placement: Placement
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            let pt1 = CGPoint(x: 0, y: 0)
            let pt2 = CGPoint(x: rect.width, y: 0)
            let pt3 = CGPoint(x: rect.width, y: rect.height)
            let pt4 = CGPoint(x: 0, y: rect.height)
            
            
//            Drawing arcs with radius
            path.move(to: pt4)
            path.addArc(tangent1End: pt1, tangent2End: pt2, radius: 15)
            path.addArc(tangent1End: pt2, tangent2End: pt3, radius: 15)
            path.addArc(tangent1End: pt3, tangent2End: pt4, radius: 15)
            path.addArc(tangent1End: pt4, tangent2End: pt1, radius: 15)
            
//            Arrow
            path.move(to: pt1)
            
            path.addLine(to: CGPoint(x: placement == .leading ? 10 : rect.width-10, y: 0))
            path.addLine(to: CGPoint(x: placement == .leading ? 15 : rect.width-15, y: 0))
            path.addLine(to: CGPoint(x: placement == .leading ? 25 : rect.width-25, y: -15))
            path.addLine(to: CGPoint(x: placement == .leading ? 40 : rect.width-40, y: 0))
        }
    }
}

struct Ex2ArrowShape: Shape{
    
    func path(in rect: CGRect) -> Path {
        
        let center = rect.width / 2
        return Path{ path in
        
            path.move(to:  CGPoint(x: 0, y: 0))
            
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height-20))
            path.addLine(to: CGPoint(x: center-15, y: rect.height-20))
            path.addLine(to: CGPoint(x: center, y: rect.height-5))
            path.addLine(to: CGPoint(x: center+15, y: rect.height-20))
            path.addLine(to: CGPoint(x: 0, y: rect.height-20))

        }
    }
}
