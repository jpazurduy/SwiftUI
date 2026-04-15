//
//  CREDO ACADEMY ♥ DESIGN AND CODE
//  SwiftUI • SwiftData • Apple Intelligence • UI/UX Design • Apple AR
//  https://credo.academy
//  Created by Robert Petras
//

import SwiftUI

struct ButtonImageView: View {
  let symbolName: String
  
  var body: some View {
    Image(systemName: symbolName)
      .resizable()
      .scaledToFit()
      .foregroundStyle(.blue.gradient)
      .padding(8)
      .background(
        Circle()
          .fill(.ultraThickMaterial)
      )
      .frame(width: 80)
      .glassEffect(.regular.interactive()) // TODO: - NEW CODE
  }
}

#Preview {
  ButtonImageView(symbolName: "plus.circle.fill")
}
