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
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	@ObservedObject var pedometerService = PedometerService()
	
	// MARK: BODY
	var body: some Scene {
		WindowGroup {
			HomeView()
				.environmentObject(pedometerService)
				.onAppear {
					UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
					AppDelegate.orientationLock = .portrait
				}
		}
	}
}

class AppDelegate: NSObject, UIApplicationDelegate {
	
	static var orientationLock = UIInterfaceOrientationMask.all
	
	func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
		return AppDelegate.orientationLock
	}
}
