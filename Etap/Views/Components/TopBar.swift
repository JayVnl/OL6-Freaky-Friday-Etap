//
//  TopBar.swift
//  Etap
//
//  Created by Jorrit Verstappen on 01/04/2022.
//

import SwiftUI

struct TopBar: View {
	// MARK: PROPERTIES
	
	// MARK: BODY
		var body: some View {
			ZStack() {
				GeometryReader { g in
					VStack(alignment: .leading,spacing: 5) {
						Rectangle()
							.fill(Color("Primary"))
							.frame(maxHeight: 130)
						Rectangle()
							.fill(Color("Primary"))
							.frame(maxHeight: 5)
						Rectangle()
							.fill(Color("Primary"))
							.frame(maxWidth: g.size.width * 0.75, maxHeight: 5)
						Rectangle()
							.fill(Color("Primary"))
							.frame(maxWidth: g.size.width * 0.5, maxHeight: 5)
					}
				}.frame(maxHeight: 160)
				
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
				.padding(.bottom, 20)
			} //: ZSTACK
			.frame(maxWidth: .infinity)
		}
}

// MARK: PREVIEW
struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar().previewLayout(.sizeThatFits)
    }
}
