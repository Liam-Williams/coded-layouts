//
//  CustomView1.swift
//  coded-layouts
//
//  Created by Liam Williams on 2016-12-15.
//  Copyright © 2016 lighthouse. All rights reserved.
//

import UIKit

class CustomView1: UIView {
  
  let redView = UIView()
  let redSubview = UIView()
  
  init() {
    super.init(frame: CGRect.zero)
    self.backgroundColor = .blue
    
    addSubview(redView)
    redView.addSubview(redSubview)
    redView.backgroundColor = .red
    redSubview.backgroundColor = .black
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let width = self.bounds.width
    
    redView.frame = CGRect(x: 20, y: 100, width: width - 40, height: 300)
    
    redSubview.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
