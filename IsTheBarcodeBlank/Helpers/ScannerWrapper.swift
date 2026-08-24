//
//  ScannerWrapper.swift
//  IsTheBarcodeBlank
//
//  Created by Danielle Cushing on 8/24/26.
//

import SwiftUI
import VisionKit
import Vision

@MainActor
struct ScannerWrapper: UIViewControllerRepresentable, Debuggable {
    @Binding var scannedCode: String?
    @Environment(\.dismiss) var dismiss
    
    /** Create the scanner view controller */
    var scannerViewController = DataScannerViewController(
      recognizedDataTypes: [.barcode()],
      qualityLevel: .balanced,
      recognizesMultipleItems: false,
      isHighFrameRateTrackingEnabled: false,
      isPinchToZoomEnabled: true,
      isGuidanceEnabled: true,
      isHighlightingEnabled: true
    )

    /** Track if the scanner is supported and available or not */
    var scannerAvailable: Bool {
      DataScannerViewController.isSupported &&
      DataScannerViewController.isAvailable
    }

    typealias UIViewControllerType = DataScannerViewController

    func makeUIViewController(context: Context) -> DataScannerViewController {
      scannerViewController.delegate = context.coordinator
      return scannerViewController
    }

    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) { }

    func makeCoordinator() -> Coordinator {
        Coordinator(scannedCode: $scannedCode, dismiss: dismiss)
    }

    class Coordinator: NSObject, DataScannerViewControllerDelegate, Debuggable {
        @Binding var scannedCode: String?
        var dismiss: DismissAction
        
        init(scannedCode: Binding<String?>, dismiss: DismissAction) {
            self._scannedCode = scannedCode
            self.dismiss = dismiss
        }
        
        /**
         Data scanner delegate function called when a new item is scanned
         `DataScannerViewController` can scan an item as text, but we only care about barcodes
         */
        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            guard let item = allItems.first else { return }
            switch item {
            case .barcode(let barcode):
                if let sanitized = barcode.observation.payloadStringValue {
                    log("scanner recognized item as code: \(sanitized)")
                    self.scannedCode = sanitized
                    dismiss()
                } else {
                    log("scanner unable to parse barcode into a string")
                }
            default:
                log("scanner did not scan a barcode")
            }
        }
    }
}
