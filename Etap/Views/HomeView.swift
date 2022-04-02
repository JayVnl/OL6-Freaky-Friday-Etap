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
		@EnvironmentObject var pedoMeterService: PedometerService
	
	// MARK: BODY
	var body: some View {
		VStack {
			
			TopBar()
			
			Spacer()
			
			TimerButton()
			
			Spacer()
			
			TimerText(label: formatInterval(interval: pedoMeterService.steps ?? 0))
			
			Text(pedoMeterService.steps != nil ? "\(Int(pedoMeterService.steps!)) steps" : "steps")
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
			pedoMeterService.initializePedometer()
		}
	}
}

// MARK: PREVIEW
struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
			.environmentObject(PedometerService())
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
