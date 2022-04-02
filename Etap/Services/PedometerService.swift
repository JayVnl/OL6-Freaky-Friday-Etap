//
//  PedometerService.swift
//  Etap
//
//  Created by Jorrit Verstappen on 02/04/2022.
//

import Foundation
import CoreMotion

class PedometerService: ObservableObject {
		private let pedometer: CMPedometer = CMPedometer()
		@Published var steps: Double? = 0.0
	
		private var isPedometerAvailable: Bool {
			return CMPedometer.isPedometerEventTrackingAvailable() && CMPedometer.isStepCountingAvailable()
		}
	
		func initializePedometer() {
			if isPedometerAvailable {
				pedometer.startUpdates(from: Calendar.current.startOfDay(for: Date())) { data, error in
					guard let data = data, error == nil else { return }
					
					DispatchQueue.main.async {
						self.steps = data.numberOfSteps.doubleValue
					}
				}
			}
		}
}
