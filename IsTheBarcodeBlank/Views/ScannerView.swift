//
//  ScannerView.swift
//  IsTheBarcodeBlank
//
//  Created by Danielle Cushing on 8/24/26.
//

import SwiftUI
import VisionKit

struct ScannerView: View {
    @Binding var scannedCode: String?
    @Environment(\.dismiss) var dismiss

    /** Track if the scanner is supported and available or not */
    private var scannerAvailable: Bool {
      DataScannerViewController.isSupported &&
      DataScannerViewController.isAvailable
    }

    @ViewBuilder
    var body: some View {
        if !scannerAvailable {
            VStack(spacing: 20) {
                Text("Scanner unavailable")
                Link("Open Settings", destination: URL(string: UIApplication.openSettingsURLString)!)
                Button("Return home") { dismiss() }
            }
        } else {
            ScannerWrapper(scannedCode: $scannedCode)
        }
    }
}

#Preview {
    ScannerView(scannedCode: .constant(nil))
}
