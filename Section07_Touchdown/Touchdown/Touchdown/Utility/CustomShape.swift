//
//  CustomShape.swift
//  Touchdown
//
//  Created by Jorge Azurduy on 9/3/22.
//

import SwiftUI

struct CustomShape: Shape {
    
    // MARK: - PROPERTIES
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}

// MARK: - PREVIEW
struct CustomShape_Previews: PreviewProvider {
    static var previews: some View {
        CustomShape()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
