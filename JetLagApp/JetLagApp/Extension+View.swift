//
//  Extension+View.swift
//  JetLagApp
//
//  Created by Shin Jae Ung on 2023/03/04.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        return clipShape(RoundedCorner(radius: radius, corners: corners))

    }
    
    func helveticaFont(size: CGFloat, weight: FontWeight) -> some View {
        let font: UIFont
        switch weight {
        case .regular:
            font = UIFont(name: "Helvetica", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
        case .bold:
            font = UIFont(name: "Helvetica-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
        @unknown default:
            font = UIFont(name: "Helvetica", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
        }
        
        return ModifiedContent(content: self, modifier: ViewWithFontApplied(font: font))
    }
}

private struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

private struct ViewWithFontApplied: ViewModifier {
    let font: UIFont
    
    func body(content: Content) -> some View {
        content
            .font(Font(font))
    }
}
