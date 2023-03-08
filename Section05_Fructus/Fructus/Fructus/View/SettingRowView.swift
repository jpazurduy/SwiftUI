//
//  SettingRowView.swift
//  Fructus
//
//  Created by Jorge Azurduy on 8/23/22.
//

import SwiftUI

struct SettingRowView: View {
    // MARK: - PROPERTIES
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 4)
            HStack {
                Text(name)
                    .foregroundColor(.gray)
                Spacer()
                if let content = content {
                    Text(content)
                        .foregroundColor(.gray)
                } else if (linkLabel != nil &&   linkDestination != nil) {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.rigth.square")
                        .foregroundColor(.pink)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingRowView(name: "Developer", content: "Jhon / Jane")
                .previewLayout(.sizeThatFits)
            .padding()
            SettingRowView(name: "Developer", content: "Jhon / Jane")
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
