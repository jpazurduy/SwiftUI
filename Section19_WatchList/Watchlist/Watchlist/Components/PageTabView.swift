//
//  CREDO ACADEMY ♥ DESIGN AND CODE
//  SwiftUI • SwiftData • Apple Intelligence • UI/UX Design • Apple AR
//  https://credo.academy
//  Created by Robert Petras
//

import SwiftUI

struct PageTabView: View {
  var icon: String
  var description: String
  
  var body: some View {
    VStack(spacing: 8) {
      Image(systemName: icon)
        .imageScale(.large)
        .font(.largeTitle.weight(.light))
        .symbolEffect(.breathe)
      
      Text(description)
        .font(.title.weight(.light))
        .fontWidth(.compressed)
        .multilineTextAlignment(.center)
    }
  }
}

#Preview {
  PageTabView(icon: "1.circle", description: "Add some movies to the watchlist if you plan to watch later")
    .padding()
}
