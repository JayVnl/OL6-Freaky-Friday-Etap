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
			VStack() {
				TopBar()
				Spacer()
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

struct TopBar: View {
		var body: some View {
			ZStack {
				Rectangle()
					.fill(Color("Primary"))
					.frame(maxHeight: 140)
				
				HStack {
					VStack(alignment: .leading) {
						Text("Etap")
							.foregroundColor(Color.white)
							.font(.system(size: 36))
						Text("Every step counts")
							.foregroundColor(Color.white)
					} //: VSTACK
					Spacer()
					Text("1st of April")
						.foregroundColor(Color.white)
				} //: HSTACK
				.frame(maxWidth: .infinity)
				.padding(.horizontal, 20)
			} //: ZSTACK
			.frame(maxWidth: .infinity)
		}
}
