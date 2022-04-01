//
//  StopwatchService.swift
//  Etap
//
//  Created by Jorrit Verstappen on 01/04/2022.
//

import Foundation
import SwiftUI
class StopwatchService: ObservableObject {
		@Published var secondsElapsed = 0.0
		var timer = Timer()
	
		func start() {
				timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
						self.secondsElapsed += 0.1
				}
		}
}
