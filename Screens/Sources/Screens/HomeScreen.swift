//
//  HomeScreen.swift
//  Screens
//
//  Created by Carl Funk on 10/21/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Domain
import SwiftUI
import UI
import UseCases

public struct HomeScreen: View {
    @State private var location: LocationQuery = .default()
    
    public init() { }
    
    public var body: some View {
        LocationWeatherScreen(location: location)
            .task(loadData)
    }
    
    @Sendable
    private func loadData() async {
        let homeLocationStream = GetHomeLocationSettingSubscriptionUseCase.run()
        for await location in homeLocationStream {
            self.location = location
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView {
            HomeScreen()
        }
    }
}
