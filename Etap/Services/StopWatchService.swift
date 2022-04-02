//
//  StopwatchService.swift
//  Etap
//
//  Created by Jorrit Verstappen on 01/04/2022.
//

import Foundation
import SwiftUI

enum stopWatchMode {
		case running
		case stopped
		case paused
}

class StopWatchService: ObservableObject {
		@Published var mode: stopWatchMode = .stopped
		@Published var secondsElapsed = 0.0
		var timer = Timer()
	
		func start() {
				mode = .running
				timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
						self.secondsElapsed += 0.1
				}
		}
	
		func pause() {
				// PAUSE TIMER WHEN USER HAS STOPPED WALKING
				timer.invalidate()
				mode = .paused
		}
		
		func stop() {
				// SAVE TIME TO DATE IN STORAGE
				timer.invalidate()
				secondsElapsed = 0
				mode = .stopped
		}
}
