//
//  AboutView.swift
//  IsTheBarcodeBlank
//
//  Created by Danielle Cushing on 8/24/26.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    Link("Github", destination: Links.githubProject.url)
                        .font(.title)
                    Link("Report a bug", destination: Links.issues.url)
                        .font(.title)
                }
                .padding()
            }
            .scrollBounceBehavior(.basedOnSize)
            .scrollTargetBehavior(.viewAligned)
            .defaultScrollAnchor(.center)
        }
        .navigationTitle("About")
    }
}

#Preview {
    AboutView()
}
