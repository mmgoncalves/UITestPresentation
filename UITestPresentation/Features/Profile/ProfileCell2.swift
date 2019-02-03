//
//  ProfileCell2.swift
//  UITestPresentation
//
//  Created by Mateus Marques on 03/02/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import UIKit

class ProfileCell2: UITableViewCell {
	
	private(set) lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.backgroundColor = .darkGray
		label.textColor = .white
		label.font = UIFont.boldSystemFont(ofSize: 13)
		return label
	}()
	
	func setup(title: String) {
		contentView.addSubview(titleLabel)
		titleLabel.text = title
		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
			titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
			titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
			titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
			titleLabel.heightAnchor.constraint(equalToConstant: 30)
			])
	}
}

