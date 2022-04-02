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
	
	init() {
					for family in UIFont.familyNames.sorted() {
							let names = UIFont.fontNames(forFamilyName: family)
							print("Family: \(family) Font names: \(names)")
					}
			}
	
	// MARK: BODY
	var body: some Scene {
		WindowGroup {
			HomeView()
				.environmentObject(stopWatchService)
		}
	}
}
