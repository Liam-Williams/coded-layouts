//
//  CustomView2.swift
//  coded-layouts
//
//  Created by Liam Williams on 2016-12-15.
//  Copyright © 2016 lighthouse. All rights reserved.
//

import UIKit

class CustomView2: UIScrollView {
  
  let greenView = UIView()
  
  init() {
    super.init(frame: CGRect.zero)
    
    addSubview(greenView)
    greenView.backgroundColor = .green
    backgroundColor = .blue
    
    greenView.translatesAutoresizingMaskIntoConstraints = false
    
    greenView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
    
    greenView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    
    greenView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
    
    greenView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
    
    let height = greenView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2.0, constant: 0)
    
    height.isActive = true

    
    greenView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    

    UIView.animate(withDuration: 3) {
      
      self.layoutIfNeeded()
    }
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
