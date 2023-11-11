//
//  InfoView.swift
//  CollegeCooks
//
//  Created by Shrestha, Oliva on 12/12/22.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack{
            Color("Backgroundcolor").ignoresSafeArea()
        VStack {
            Spacer()
            Image("icon")
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
            Text(Bundle.main.displayName ?? "")
                .font(.largeTitle)
                .fontWeight(.medium)
            Text(Bundle.main.version ?? "")
                .font(.title)
                .fontWeight(.medium)
            Text(Bundle.main.build ?? "")
                .font(.caption)
            Spacer()

            Text(Bundle.main.copyright ?? "")
                .font(.caption2)
        }
        .padding()
    }
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
