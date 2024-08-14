//
//  ViewCode.swift
//  DataUSA
//
//  Created by Harold José on 13/08/2024.
//

import Foundation

protocol ViewCodeConformanceProtocol {
    func setupHierarchy()
    func setupConstraints()
    func setupStyle()
}

extension ViewCodeConformanceProtocol {
    func setup() {
        setupHierarchy()
        setupConstraints()
        setupStyle()
    }
}
