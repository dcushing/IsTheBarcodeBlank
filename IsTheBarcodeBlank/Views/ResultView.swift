//
//  ResultView.swift
//  IsTheBarcodeBlank
//
//  Created by Danielle Cushing on 8/24/26.
//

import SwiftUI

struct ResultView: View {
    let result: String
    let onDismiss: () -> Void
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                Text("You scanned:")
                    .font(.title)
                Text(result)
                    .font(.title2)
                ForEach(ResultCheck.allCases) { check in
                    ResultItemView(check: check, result: result)
                }
            }
        }
        .scrollBounceBehavior(.basedOnSize)
        .scrollTargetBehavior(.viewAligned)
        .padding()
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Scan another") { tappedScanAnother() }
            }
        }
    }

    private func tappedScanAnother() {
        self.onDismiss()
        dismiss()
    }
}

private struct ResultItemView: View {
    let check: ResultCheck
    let result: String
    let isTrue: Bool

    init(check: ResultCheck, result: String) {
        self.check = check
        self.result = result
        self.isTrue = check.isTrue(code: result)
    }
    
    var body: some View {
        HStack {
            Text(check.label)
            Spacer()
            Text(isTrue.localizedLabel)
            if check == .url && isTrue, let url = URL(string: result) {
                Link("Open in browser", destination: url)
                    .multilineTextAlignment(.trailing)
            }
        }
    }
}

#Preview("Positive number") {
    ResultView(result: "1001000100", onDismiss: {})
}

#Preview("Negative number") {
    ResultView(result: "-100100.2", onDismiss: {})
}

#Preview("URL") {
    ResultView(result: Links.githubProject.urlString, onDismiss: {})
}
