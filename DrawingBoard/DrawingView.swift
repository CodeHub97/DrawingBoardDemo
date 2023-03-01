//
//  DrawingView.swift
//  DrawingBoard
//
//  Created by Gagan iOS Hub on 09/09/22.
//

import Foundation
import UIKit

class DrawingView: UIView {
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let touch = touches.first else { return }
    let firstPoint = touch.location(in: self)
    
    DrawingHandler.shared.lineArray.append([CGPoint]())
    DrawingHandler.shared.lineArray[DrawingHandler.shared.lineArray.count - 1].append(firstPoint)
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    guard let touch = touches.first else { return }
    let currentPoint = touch.location(in: self)
    DrawingHandler.shared.lineArray[DrawingHandler.shared.lineArray.count - 1].append(currentPoint)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    
      self.setNeedsDisplay()
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
  
  }
  
  override func draw(_ rect: CGRect) {
    guard let context = UIGraphicsGetCurrentContext() else { return }
    draw(inContext: context)
  }
  
  func draw(inContext context: CGContext) {
    
    context.setLineWidth(5)
    context.setStrokeColor(DrawingHandler.shared.selectedColor.cgColor)
    context.setLineCap(.round)
    
    for line in DrawingHandler.shared.lineArray {
      
      guard let firstPoint = line.first else { continue }
      context.beginPath()
      context.move(to: firstPoint)
      
      for point in line.dropFirst() {
        context.addLine(to: point)
      }
      context.strokePath()
    }
  }
  
  
  
}
