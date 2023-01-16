//
//  PickerContentView.swift
//  TodoApp
//
//  Created by Jorge Azurduy on 1/16/23.
//

import SwiftUI

//enum IconColor: String, CaseIterable, Identifiable {
//    case blue = "Blue"
//    case blueLight = "Blue Light"
//    case blueDark = "Blue Dark"
//    case pink = "Pink"
//    case pinkLight = "Pink Light"
//    case pingDark = "Pink Dark"
//    case green = "Green"
//    case greenLight = "Green Light"
//    case greenDark = "Green Dark"
//    
//    var id: Self { self }
//}

struct PickerContentView: View {
    // MARK: - PROPERTIES
    @State var image: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
                .cornerRadius(8)
            
            Spacer()
                .frame(width: 8)
            
            Text(image)
                .frame(alignment: .leading)
            
        } // HSTACK
        .padding(3)
    }
}

// MARK: - PREVIEW
struct PickerContentView_Previews: PreviewProvider {
    static var previews: some View {
        PickerContentView(image: "Blue")
    }
}
