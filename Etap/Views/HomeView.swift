//
//  ContentView.swift
//  Etap
//
//  Created by Jorrit Verstappen on 01/04/2022.
//

import SwiftUI

struct HomeView: View {
	// MARK: PROPERTIES
	@EnvironmentObject var stopWatchService: StopWatchService
	
	// MARK: BODY
    var body: some View {
			VStack {
				
				TopBar()
				
				Spacer()
				
				TimerButton()
					.environmentObject(stopWatchService)
				
				Spacer()
				
				TimerText(label: formatInterval(interval: stopWatchService.secondsElapsed))
				
				Spacer()
				
				Rectangle()
					.frame(maxHeight: 80)
					.padding(.horizontal, 20)
					.foregroundColor(Color("Primary"))
			} //: VSTACK
			.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).background(Color("Secondary")).edgesIgnoringSafeArea(.all)
    }
}

// MARK: PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
			HomeView()
				.environmentObject(StopWatchService())
    }
}

func formatInterval(interval: Double) -> String {
	let formatter = DateComponentsFormatter()
	formatter.allowedUnits = [.hour, .minute, .second]
	formatter.zeroFormattingBehavior = .pad
	formatter.unitsStyle = .positional

	let formattedString = formatter.string(from: TimeInterval(interval))!
	return formattedString
}
