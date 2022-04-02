//
//  ContentView.swift
//  Etap
//
//  Created by Jorrit Verstappen on 01/04/2022.
//

import SwiftUI
import CoreMotion

struct HomeView: View {
	// MARK: PROPERTIES
	@EnvironmentObject var stopWatchService: StopWatchService
	private let pedometer: CMPedometer = CMPedometer()
	
	@State private var steps: Double?
	
	private var isPedometerAvailable: Bool {
		return CMPedometer.isPedometerEventTrackingAvailable() && CMPedometer.isStepCountingAvailable()
	}
	
	private func initializePedometer() {
		if isPedometerAvailable {
			
			pedometer.queryPedometerData(from: Calendar.current.startOfDay(for: Date()), to: Date()) { (data, error) in
				guard let data = data, error == nil else { return }

				steps = data.numberOfSteps.doubleValue
			}
			
			pedometer.startUpdates(from: Calendar.current.startOfDay(for: Date())) { data, error in
				guard let data = data, error == nil else { return }
				
				DispatchQueue.main.async {
					steps = data.numberOfSteps.doubleValue
				}
			}
		}
	}
	
	// MARK: BODY
	var body: some View {
		VStack {
			
			TopBar()
			
			Spacer()
			
			TimerButton()
				.environmentObject(stopWatchService)
			
			Spacer()
			
//			TimerText(label: formatInterval(interval: stopWatchService.secondsElapsed))
			TimerText(label: formatInterval(interval: steps ?? 0))
			
			Text(steps != nil ? "\(Int(steps!)) steps" : "steps")
				.foregroundColor(Color("Primary"))
				.font(.custom(FontNameManager.FallingSky.medium, size: 28))
			
			Spacer()
			
			Rectangle()
				.frame(maxHeight: 80)
				.padding(.horizontal, 20)
				.foregroundColor(Color("Primary"))
		} //: VSTACK
		.frame(width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
		.background(Color("Secondary"))
		.edgesIgnoringSafeArea(.all)
		.onAppear {
			initializePedometer()
		}
	}
}

// MARK: PREVIEW
struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
			.environmentObject(StopWatchService())
			.previewDevice("iPhone 12 Pro")
	}
}

func formatInterval(interval: Double) -> String {
	let formatter = DateComponentsFormatter()
	formatter.allowedUnits = [.hour, .minute, .second]
	formatter.zeroFormattingBehavior = .pad
	formatter.unitsStyle = .positional
	
	let formattedString = formatter.string(from: TimeInterval(interval * 0.55))!
	return formattedString
}
