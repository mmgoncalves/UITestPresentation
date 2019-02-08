//
//  MathViewController.swift
//  UITestPresentation
//
//  Created by Mateus Marques on 17/01/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import UIKit

class MathViewController: UIViewController {
	
	private(set) lazy var value1TextField: UITextField = {
		let field = UITextField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.accessibilityIdentifier = "value1TextField"
		field.borderStyle = .roundedRect
		return field
	}()
	
	private(set) lazy var value2TextField: UITextField = {
		let field = UITextField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.accessibilityIdentifier = "value2TextField"
		field.borderStyle = .roundedRect
		return field
	}()
	
	private(set) lazy var symbolLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.accessibilityIdentifier = "symbolLabel"
		return label
	}()
	
	private(set) lazy var equalLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.accessibilityIdentifier = "equalLabel"
		label.text = "="
		return label
	}()
	
	private(set) lazy var resultLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.accessibilityIdentifier = "resultLabel"
		return label
	}()
	
	private(set) lazy var button: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(action), for: UIControl.Event.touchUpInside)
		button.accessibilityIdentifier = "button"
		button.setTitle("Calcular", for: .normal)
		button.setTitleColor(UIColor.white, for: .normal)
		button.backgroundColor = .darkGray
		button.layer.cornerRadius = 4
		button.clipsToBounds = true
		return button
	}()
	
	private(set) lazy var fieldsStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .horizontal
		stackView.distribution = .fillEqually
		stackView.spacing = 20
		return stackView
	}()
	
	private(set) lazy var operationsStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .horizontal
		stackView.distribution = .fillEqually
		stackView.spacing = 20
		return stackView
	}()
	
	private(set) lazy var errorAlert: UIAlertController = {
		let alert = UIAlertController(title: "Ops", message: "", preferredStyle: .alert)
		let action = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
		alert.addAction(action)
		return alert
	}()
	
	let mathOperation = MathOperation()
	var currentOperation: OperationType?
	
	// MARK: - init -
	init() {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		view.addSubview(fieldsStackView)
		fieldsStackView.addArrangedSubview(value1TextField)
		fieldsStackView.addArrangedSubview(symbolLabel)
		fieldsStackView.addArrangedSubview(value2TextField)
		fieldsStackView.addArrangedSubview(equalLabel)
		fieldsStackView.addArrangedSubview(resultLabel)
		view.addSubview(operationsStackView)
		view.addSubview(button)
    setupConstraints()
    addOperationsButton()
	}
	
	@objc func action() {
		guard let operation = currentOperation else {
			alert(with: .symbolError)
			return
		}
		guard let value1String = value1TextField.text else {
			alert(with: .valueError)
			return
		}
		guard let value2String = value2TextField.text else {
			alert(with: .valueError)
			return
		}
		guard let value1 = Double(value1String) else {
			alert(with: .unknown)
			return
		}
		guard let value2 = Double(value2String) else {
			alert(with: .unknown)
			return
		}
		
		let result = mathOperation.result(operation: operation, value1: value1, value2: value2)
		resultLabel.text = String(result)
	}
	
	@objc func operationAction(_ button: OperationButton) {
		currentOperation = button.operationType
		symbolLabel.text = button.operationType.rawValue
	}
	
	private func addOperationsButton() {
		for operation in OperationType.allCases {
			let button = OperationButton(operationType: operation)
			button.translatesAutoresizingMaskIntoConstraints = false
			button.setTitle(operation.rawValue, for: .normal)
			button.accessibilityLabel = "Operação: \(operation.rawValue)"
			button.accessibilityIdentifier = "op_\(operation.rawValue)"
			button.addTarget(self, action: #selector(operationAction(_:)), for: .touchUpInside)
			operationsStackView.addArrangedSubview(button)
		}
	}
	
	private func alert(with message: ErrorMessage) {
		errorAlert.message = message.rawValue
		present(errorAlert, animated: true, completion: nil)
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			fieldsStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
			fieldsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			fieldsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
			fieldsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
			fieldsStackView.heightAnchor.constraint(equalToConstant: 40)
			])
		
		NSLayoutConstraint.activate([
			operationsStackView.topAnchor.constraint(equalTo: value1TextField.bottomAnchor, constant: 20),
			operationsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			operationsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
			operationsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
			operationsStackView.heightAnchor.constraint(equalToConstant: 40)
			])
		
		NSLayoutConstraint.activate([
			button.heightAnchor.constraint(equalToConstant: 40),
			button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
			button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
//      button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
      button.topAnchor.constraint(equalTo: operationsStackView.bottomAnchor, constant: 40)
			])
	}
}

enum ErrorMessage: String {
	case symbolError = "Escolha a operação que deseja realiar"
	case valueError = "Digite os valores corretamente"
	case unknown = "Algo de errado não está certo"
}
