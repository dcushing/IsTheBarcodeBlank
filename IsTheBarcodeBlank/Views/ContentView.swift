//
//  ContentView.swift
//  IsTheBarcodeBlank
//
//  Created by Danielle Cushing on 8/24/26.
//

import SwiftUI
import VisionKit

struct ContentView: View {
    @State private var scannedCode: String?
    @State private var isShowingScanner = false

    var body: some View {
        VStack(spacing: 20) {
            if let scannedCode {
                ResultView(result: scannedCode, onDismiss: onDimsissResult)
            } else {
                Text("No code scanned yet")
                    .foregroundColor(.gray)
            }

            Button("Scan code") {
                isShowingScanner = true
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .sheet(isPresented: $isShowingScanner) {
            ScannerView(scannedCode: $scannedCode)
        }
    }

    private func onDimsissResult() {
        self.scannedCode = nil
    }
}

#Preview {
    ContentView()
}
