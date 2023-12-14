//
//  CustomLabelRowView.swift
//  HikeApp
//
//  Created by Jorge Azurduy on 14/12/23.
//

import SwiftUI

struct CustomLabelRowView: View {
    // MARK: - PROPERTIES
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String
    @State var rowColor: Color
    
    var body: some View {
        // 2. Advanced label content
        LabeledContent {
            Text(rowContent)
                .foregroundColor(.primary)
                .fontWeight(.heavy)
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(rowColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomLabelRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowColor: .red)
    }
}
