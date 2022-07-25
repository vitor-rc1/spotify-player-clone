//
//  ViewCode.swift
//  desafio-dev-sprint
//
//  Created by Vitor Conceicao on 22/07/22.
//

import Foundation

protocol ViewCode {
    func setupSubviews()
    func setupConstraint()
    func setupExtraConfiguration()
    func setup()
}

extension ViewCode {
    func setup() {
        setupSubviews()
        setupConstraint()
        setupExtraConfiguration()
    }

    func setupExtraConfiguration() {}
}
