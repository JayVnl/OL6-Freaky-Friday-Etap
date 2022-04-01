//
//  ContentView.swift
//  Etap
//
//  Created by Jorrit Verstappen on 01/04/2022.
//

import SwiftUI

struct HomeView: View {
	// MARK: PROPERTIES
	
	// MARK: BODY
    var body: some View {
			VStack {
				TopBar()
				Spacer()
				TimerButton()
				Spacer()
				Rectangle()
					.frame(maxWidth: 300, maxHeight: 90)
				Spacer()
				Rectangle()
					.frame(maxWidth: 300, maxHeight: 80)
			} //: VSTACK
			.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).background(Color("Secondary")).edgesIgnoringSafeArea(.all)
    }
}

// MARK: PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
