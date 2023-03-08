//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by Jorge Azurduy on 8/23/22.
//

import SwiftUI

struct FruitNutrientsView: View {
    // MARK: - PROPERTIES
    var fruit :Fruit
    let nutrients: [String] = ["Energy", "Sugar","Fat","Protein","Vitamins", "Minerals"]
    // MARK: - BOODY
    var body: some View {
        GroupBox {
            DisclosureGroup("Nutritional value per 100gr") {
                ForEach(0..<nutrients.count, id: \.self ) {item in
                    Divider()
                        .padding(.vertical, 6)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        Text(fruit.nutrition[item])
                    }
                    
                }
                
            }
            
        } //GroupBox
    }
}

// MARK: - PREVIEW
struct FruitNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FruitNutrientsView(fruit: FruitData.fruitsData[0])
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 480))
                .padding()
        }
    }
}
