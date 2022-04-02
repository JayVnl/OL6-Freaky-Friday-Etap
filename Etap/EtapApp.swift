//
//  EtapApp.swift
//  Etap
//
//  Created by Jorrit Verstappen on 01/04/2022.
//

import SwiftUI

@main
struct EtapApp: App {
	// MARK: PROPERTIES
	@ObservedObject var stopWatchService = StopWatchService()
	
	// MARK: BODY
	var body: some Scene {
		WindowGroup {
			HomeView()
				.environmentObject(stopWatchService)
		}
	}
}
