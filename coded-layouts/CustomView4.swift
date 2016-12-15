//
//  CustomView4.swift
//  coded-layouts
//
//  Created by Liam Williams on 2016-12-15.
//  Copyright © 2016 lighthouse. All rights reserved.
//

import UIKit
import Stevia

class CustomView4: UIView {

  let whiteView = UIView()
  
  init() {
    super.init(frame: CGRect.zero)
    
    whiteView.backgroundColor = .white
    backgroundColor = .black
    
    // Stevia shortcut for add subview
    sv(whiteView)
    
    // Stevia chainable (returns self, so can call another instance method), and short useful methods for defining layouts
    whiteView.top(50).left(50).right(50).height(200)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
