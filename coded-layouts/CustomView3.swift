//
//  CustomView3.swift
//  coded-layouts
//
//  Created by Liam Williams on 2016-12-15.
//  Copyright © 2016 lighthouse. All rights reserved.
//

import UIKit

class CustomView3: UIView {
  
  let purpleView = UIView()

  init() {
    super.init(frame: CGRect.zero)
    
    purpleView.translatesAutoresizingMaskIntoConstraints = false
    purpleView.backgroundColor = .purple
    
    addSubview(purpleView)
    
    let constraints = [
      NSLayoutConstraint(item: purpleView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 50),
      NSLayoutConstraint(item: purpleView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -50),
      NSLayoutConstraint(item: purpleView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 50),
      NSLayoutConstraint(item: purpleView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.5, constant: 0)
    ]
    
    addConstraints(constraints)
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
