//
//  TestUI.swift
//  Paws
//
//  Created by Jorge Azurduy on 2/3/26.
//

import SwiftUI

struct TestUI: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        
            ScrollView {
                Text("aasdfasdf")
                    .padding()
                
                LazyVGrid(columns: columns, spacing: 16) {
                    
                    ForEach(0..<50) { index in
                        
                        Text("Item \(index)")
                            .frame(height: 80)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.opacity(0.7))
                            .cornerRadius(8)
                    }
                }
                .padding()
                
                .background(.red)
                
                
            }
            
        
    }
}

#Preview {
    TestUI()
}
