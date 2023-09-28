//
//  UIStackView+Extensions.swift
//  Desafio Rick and Morty
//
//  Created by Hellen Caroline  on 27/09/23.
//

import UIKit

extension UIStackView {

    convenience init(
        _ arrangedSubviews: [UIView] = [],
        axis: NSLayoutConstraint.Axis = .vertical,
        distribution: Distribution = .fill,
        alignment: Alignment = .fill,
        spacing: CGFloat = 8
    ) {
        self.init()
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        self.axis = axis
        arrangedSubviews.forEach { v in
            self.addArrangedSubview(v)
        }
    }

}
