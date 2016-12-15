//
//  ViewController.swift
//  coded-layouts
//
//  Created by Liam Williams on 2016-12-15.
//  Copyright © 2016 lighthouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let customView = CustomView4()
  
  override func loadView() {
    view = customView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  
    //view.backgroundColor = .orange
  }


}

