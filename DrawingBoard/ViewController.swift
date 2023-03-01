//
//  DrawingView.swift
//  DrawingBoard
//
//  Created by Gagan iOS Hub on 09/09/22.

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func btnActionLine(_ sender: UIButton) {
    
    switch sender.tag {
    case 1:
      DrawingHandler.shared.selectedColor = .red
      break
    case 2:
      DrawingHandler.shared.selectedColor = .blue
      break
    case 3:
      DrawingHandler.shared.selectedColor = .green
      break
    default:
      break
    }
    
  }
  
}

