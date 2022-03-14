//
//  ViewController.swift
//  ExSpeechBubbleView
//
//  Created by Jake.K on 2022/02/14.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let width = 200.0
    private let height = 110.0
    private let position  = ToolTipPosition.bottom
  
  private lazy var myView = MyToolTipView(
    viewColor: UIColor.systemBlue,
    tipStartX: self.width/2 - 30.5,  // tip 삼각형 시작 위치
    tipWidth: 11.0,
    tipHeight: 6.0,
    tooltipHeight: self.height,
    tooltipPosition: self.position,
    tootipText: "말풍선에 들어갈 값을 입력하세요!\n다음 줄로 이동 글쓰기 테스팅~!!"
  )
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.myView)
    self.myView.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.width.equalTo(self.width)
      $0.height.equalTo(self.height)
    }
      
//      hideToolTip()
      
  }

    func hideToolTip() {
        self.myView.isHidden = true
    }
}
