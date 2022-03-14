//
//  MyTopTipView.swift
//  ExSpeechBubbleView
//
//  Created by Jake.K on 2022/02/15.
//

import UIKit
import SnapKit

enum ToolTipPosition: String {
    case top
    case bottom
    
    static let type = [top, bottom]
}

class MyToolTipView: UIView {
    
  init(
    viewColor: UIColor,
    tipStartX: CGFloat,
    tipWidth: CGFloat,
    tipHeight: CGFloat,
    tooltipHeight: CGFloat,
    tooltipPosition: ToolTipPosition,
    tootipText: String
  ) {
    super.init(frame: .zero)
    self.backgroundColor = viewColor
    
    let path = CGMutablePath()

    let tipWidthCenter = tipWidth / 2.0
    let endXWidth = tipStartX + tipWidth
    
    switch tooltipPosition {
    case .top:
        //위쪽 팁
        path.move(to: CGPoint(x: tipStartX, y: 0))
        print("\(tipStartX), 0")
        path.addLine(to: CGPoint(x: tipStartX + tipWidthCenter, y: -tipHeight))
        print("\(tipStartX + tipWidthCenter), \(-tipHeight)")
        path.addLine(to: CGPoint(x: endXWidth, y: 0))
        print("\(endXWidth), 0")
        path.addLine(to: CGPoint(x: 0, y: 0))
        print("0, 0")
        break

    case .bottom:
        //아래쪽 팁
        path.move(to: CGPoint(x: tipStartX, y: tooltipHeight))
        print("\(tipStartX), \(tooltipHeight)")
        path.addLine(to: CGPoint(x: tipStartX + tipWidthCenter, y: tooltipHeight+tipHeight))
        print("\(tipStartX + tipWidthCenter), \(tooltipHeight+tipHeight)")
        path.addLine(to: CGPoint(x: endXWidth, y: tooltipHeight))
        print("\(endXWidth), \(tooltipHeight)")
        path.addLine(to: CGPoint(x: 0, y: tooltipHeight))
        print("0, \(tooltipHeight)")
        break
    }
      
    let shape = CAShapeLayer()
    shape.path = path
    shape.fillColor = viewColor.cgColor

    self.layer.insertSublayer(shape, at: 0)
    self.layer.masksToBounds = false
    self.layer.cornerRadius = 16
    
      print(tootipText)
      self.addLabel(tooltipText: tootipText)
  }
  
  func addLabel(tooltipText: String) {
      print("\(tooltipText)")
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.text = tooltipText
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byCharWrapping // 글자 단위로 줄바꿈 (디폴트는 어절 단위)
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
          $0.top.bottom.equalToSuperview().inset(10)
          $0.left.right.equalToSuperview().inset(16)
        }
      }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
}
