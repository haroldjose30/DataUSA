//
//  PreviewContainer.swift
//  DataUSA
//
//  Created by Harold José on 13/08/2024.
//

import Foundation
import SwiftUI
import UIKit

struct PreviewContainer<T: UIView>: UIViewRepresentable {

    let view: T

    init(_ viewBuilder: @escaping () -> T) {
        view = viewBuilder()
    }

    // MARK: - UIViewRepresentable

    func makeUIView(context: Context) -> T {
        view
    }

    func updateUIView(_ view: T, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

