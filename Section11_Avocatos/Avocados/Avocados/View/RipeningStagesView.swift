//
//  RipeningStagesView.swift
//  Avocados
//
//  Created by Jorge Azurduy on 11/30/22.
//

import SwiftUI

struct RipeningStagesView: View {
    // MARK: - PROPERTIES
    var ripeningStages: [Ripening] = ripeningData
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                HStack(alignment: .center, spacing: 25) {
                    ForEach(ripeningStages) { stage in
                        RippeningView(ripening: stage)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 25)
                Spacer()
            }
        }
    }
}

// MARK: - PREVIEW
struct RipeningStagesView_Previews: PreviewProvider {
    static var previews: some View {
        RipeningStagesView(ripeningStages: ripeningData)
    }
}
