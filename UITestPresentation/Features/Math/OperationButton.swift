//
//  OperationButton.swift
//  UITestPresentation
//
//  Created by m.marques.goncalves on 19/01/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import UIKit

final class OperationButton: UIButton {
  let operationType: OperationType

  init(operationType: OperationType) {
    self.operationType = operationType
    super.init(frame: .zero)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    self.layer.borderColor = UIColor.darkGray.cgColor
    self.layer.borderWidth = 1
    self.setTitleColor(UIColor.darkGray, for: UIControl.State.normal)
    self.clipsToBounds = true
    self.layer.cornerRadius = 4
  }
}
