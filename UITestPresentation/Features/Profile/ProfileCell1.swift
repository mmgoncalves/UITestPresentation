//
//  ProfileCell1.swift
//  UITestPresentation
//
//  Created by Mateus Marques on 03/02/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import UIKit

class ProfileCell1: UITableViewCell {
	
	private(set) lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.backgroundColor = .blue
		label.textColor = .white
		return label
	}()
	
	func setup(title: String) {
		contentView.addSubview(titleLabel)
		titleLabel.text = title
		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
			titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
			titleLabel.heightAnchor.constraint(equalToConstant: 30)
			])
	}
}
