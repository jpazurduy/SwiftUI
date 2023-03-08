//
//  SettingLabelView.swift
//  Fructus
//
//  Created by Jorge Azurduy on 8/23/22.
//

import SwiftUI

struct SettingLabelView: View {
    // MARK: - PROPERTIES
    var labelText :String
    var labelImage: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Text(labelText.uppercased())
                .fontWeight(.bold)
        
            Spacer()
        
            Image(systemName: labelImage)
        }
    }
}

// MARK: - PREVIEW
struct SettingLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingLabelView(labelText: "Frutus", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
