//
//  WeatherButton.swift
//  Mello Clima
//
//  Created by Marcello Gonzatto Birkan on 09/06/23.
//

import SwiftUI

struct WeatherButton: View {
    let texto: String
    let cor: Color
    let corFundo: Color
    
    var body: some View {
        Text(texto)
            .foregroundColor(cor)
            .frame(width: 280, height: 50)
            .background(corFundo.gradient)
            .cornerRadius(12)
            .font(.system(size: 20, weight: .bold, design: .default))
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(texto: "clique", cor: .gray, corFundo: .cyan)
    }
}
