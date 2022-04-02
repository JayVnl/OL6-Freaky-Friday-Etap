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
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	
	// MARK: BODY
	var body: some Scene {
		WindowGroup {
			HomeView()
				.environmentObject(stopWatchService)
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
