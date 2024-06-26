//
//  ContentView.swift
//  WeatherApp
//
//  Created by Jungjin Park on 2024-06-25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        
        Home()
    }
}

#Preview {
    ContentView()
}
