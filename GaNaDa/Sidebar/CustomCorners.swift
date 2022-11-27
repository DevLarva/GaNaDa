//
//  CustomCorners.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/10/01.
//

import SwiftUI

struct CustomCorners: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii:
        CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
