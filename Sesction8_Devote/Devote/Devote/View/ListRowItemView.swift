//
//  ListRowItemView.swift
//  Devote
//
//  Created by Jorge Azurduy on 9/17/22.
//

import SwiftUI

struct ListRowItemView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item

    // MARK: - BODY
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink: Color.primary)
                .padding(.vertical, 12)
                .padding(.horizontal, 12)
                .animation(.default)
        }
        .toggleStyle(CheckBoxStyle())
        .onReceive(item.objectWillChange, perform: {
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        })
    }
}

//// MARK: - PREVIEW
//struct ListRowItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRowItemView()
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
