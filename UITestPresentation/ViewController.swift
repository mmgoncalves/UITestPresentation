//
//  ViewController.swift
//  UITestPresentation
//
//  Created by Mateus Marques on 17/01/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	lazy var titleTextField: UITextField = {
		let field = UITextField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.accessibilityIdentifier = "titleTextField"
		field.accessibilityLabel = "Insira um novo titulo"
		field.borderStyle = .roundedRect
		return field
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.accessibilityIdentifier = "titleLabel"
		label.text = "Titulo padrão"
		return label
	}()
	
	lazy var button: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(action), for: UIControl.Event.touchUpInside)
		button.accessibilityIdentifier = "button"
		button.accessibilityLabel = "Botão para trocar o titulo"
		button.setTitle("Alterar título", for: .normal)
		button.setTitleColor(UIColor.white, for: .normal)
		button.backgroundColor = .darkGray
		return button
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.addSubview(titleLabel)
		view.addSubview(titleTextField)
		view.addSubview(button)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		setupConstraints()
	}

	@objc func action() {
		titleLabel.text = titleTextField.text
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
			titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
			titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
			])
		
		NSLayoutConstraint.activate([
			titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
			titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
			titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
			])
		
		NSLayoutConstraint.activate([
			button.heightAnchor.constraint(equalToConstant: 40),
			button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
			button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
			button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
//			button.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 40)
			])
		
	}
}

