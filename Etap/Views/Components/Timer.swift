//
//  Timer.swift
//  Etap
//
//  Created by Jorrit Verstappen on 01/04/2022.
//

import SwiftUI

struct Timer: View {
	// MARK: PROPERTIES
	
	// MARK: BODY
    var body: some View {
			HStack {
				HStack(spacing: 5) {
					Rectangle()
						.frame(maxWidth: 5, maxHeight: 64)
						.foregroundColor(Color("Primary"))
					Rectangle()
						.frame(maxWidth: 5, maxHeight: 48)
						.foregroundColor(Color("Primary"))
					Rectangle()
						.frame(maxWidth: 5, maxHeight: 32)
						.foregroundColor(Color("Primary"))
					Rectangle()
						.frame(maxWidth: 5, maxHeight: 16)
						.foregroundColor(Color("Primary"))
				} //: HSTACK
				Spacer()
				Text("00:00:00")
					.font(.system(size: 60))
					.foregroundColor(Color("Primary"))
				Spacer()
				HStack(spacing: 5) {
					Rectangle()
						.frame(maxWidth: 5, maxHeight: 16)
						.foregroundColor(Color("Primary"))
					Rectangle()
						.frame(maxWidth: 5, maxHeight: 32)
						.foregroundColor(Color("Primary"))
					Rectangle()
						.frame(maxWidth: 5, maxHeight: 48)
						.foregroundColor(Color("Primary"))
					Rectangle()
						.frame(maxWidth: 5, maxHeight: 64)
						.foregroundColor(Color("Primary"))
				} //: HSTACK
			} //: HSTACK
			.frame(maxWidth: .infinity)
    }
}

// MARK: PREVIEW
struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        Timer().previewLayout(.sizeThatFits)
    }
}
