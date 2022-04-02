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
							.frame(maxHeight: 140)
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
					
					HStack(alignment: .top) {
						VStack(alignment: .leading, spacing: 6) {
							Image("Full-logo")
							Text("Every step counts")
								.foregroundColor(Color("Secondary"))
								.font(.custom(FontNameManager.FallingSky.medium, size: 21))
						} //: VSTACK
						.frame(maxWidth: .infinity, alignment: .leading)
						Spacer()
						Text(DateFormatter.displayDate.string(from: Date()))
							.font(.custom(FontNameManager.FallingSky.regular, size: 17))
							.foregroundColor(Color("Secondary"))
							.padding(.top, 4)
					} //: HSTACK
					.frame(maxWidth: .infinity, maxHeight: 125, alignment: .bottom)
					.padding(.horizontal, 20)
					
				}.frame(maxHeight: 170)
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

extension DateFormatter {
		static let displayDate: DateFormatter = {
				 let formatter = DateFormatter()
				 formatter.dateFormat = "EEEE, d MMMM"
				 return formatter
		}()
}
