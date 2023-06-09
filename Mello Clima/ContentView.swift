//
//  ContentView.swift
//  Mello Clima
//
//  Created by Marcello Gonzatto Birkan on 08/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight: Bool = false
    
    var body: some View {
        
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cidade: "São Paulo", estado: "sp")
                
                MainWeatherStatusView(imagem: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperatura: isNight ? 20 : 26)
                
                HStack(spacing: 20) {
                        WeatherNextView(dayOfWeek: "seg",
                                        imagem: "cloud.bolt.rain.fill",
                                        temperature: 18)
                        WeatherNextView(dayOfWeek: "ter",
                                        imagem: "cloud.sun.fill",
                                        temperature: 24)
                        WeatherNextView(dayOfWeek: "qua",
                                        imagem: "sun.max.fill",
                                        temperature: 28)
                        WeatherNextView(dayOfWeek: "qui",
                                        imagem: "cloud.heavyrain.fill",
                                        temperature: 19)
                        WeatherNextView(dayOfWeek: "sex",
                                        imagem: "cloud.sun.rain.fill",
                                        temperature: 21)
                    }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(texto: "Mude o Horário do dia", cor: .blue, corFundo: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherNextView: View {
    let dayOfWeek: String
    let imagem: String
    let temperature: Int
    
    var body: some View {
            VStack(spacing:2) {
                Text(dayOfWeek.uppercased())
                    .font(.system(size: 28, weight: .medium, design: .default))
                    .padding(.bottom, 2)
                
                Image(systemName: imagem)
                    .symbolRenderingMode(.multicolor)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                
                Text("\(temperature)°")
                    .font(.system(size: 28, weight: .medium))
        }
            .foregroundColor(.white)
    }
}

struct BackgroundView: View {
   
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBLue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    let cidade: String
    let estado: String
    
    var body: some View {
        Text("\(cidade), \(estado.uppercased())")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    let imagem: String
    let temperatura: Int
    
    var body: some View {
        
        VStack(spacing: 7) {
            Image(systemName: imagem)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                
            Text("\(temperatura)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .foregroundColor(.white)
        .padding(.bottom, 70)
    }
}
