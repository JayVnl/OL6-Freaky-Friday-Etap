//
//  TimerButton.swift
//  Etap
//
//  Created by Jorrit Verstappen on 01/04/2022.
//

import SwiftUI

struct TimerButton: View {
	// MARK: PROPERTIES
	@EnvironmentObject var stopWatchService: StopWatchService
	
	// MARK: BODY
    var body: some View {
			ZStack {
				Circle()
					.stroke(Color("Primary"), lineWidth: 5)
					.foregroundColor(Color("Secondary"))
				
				switch (stopWatchService.mode) {
					case .running:
						Button(action: {self.stopWatchService.pause()} ){
								Image(systemName: "stop.circle")
										.foregroundColor(Color("Secondary"))
										.font(.system(size: 50))
										.padding(30)
						}
						.background(Circle())
						.foregroundColor(Color("Primary"))

					case .paused:
						Button(action: {self.stopWatchService.start()} ){
								Image(systemName: "play.circle")
										.foregroundColor(Color("Secondary"))
										.font(.system(size: 50))
										.padding(30)
						}
						.background(Circle())
						.foregroundColor(Color("Primary"))

					case .stopped:
						Button(action: {self.stopWatchService.start()} ){
								Image(systemName: "stopwatch")
										.foregroundColor(Color("Secondary"))
										.font(.system(size: 50))
										.padding(30)
						}
						.background(Circle())
						.foregroundColor(Color("Primary"))
				}
			} //: ZSTACK
			.padding(.horizontal, 40)
			.frame(maxHeight: 320)
    }
}

// MARK: PREVIEW
struct TimerButton_Previews: PreviewProvider {
    static var previews: some View {
			TimerButton()
				.environmentObject(StopWatchService())
				.previewLayout(.sizeThatFits)
    }
}
