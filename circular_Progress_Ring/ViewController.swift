//
//  ViewController.swift
//  circular_Progress_Ring
//
//  Created by 王昱淇 on 2021/8/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let circle = addRing()
        view.addSubview(circle)
        
        let barcodeImageView = UIImageView(image: UIImage(named: "條碼"))
        barcodeImageView.frame = CGRect(x: 30, y: 680, width: 350, height: 80)
        barcodeImageView.contentMode = .scaleAspectFill
        view.addSubview(barcodeImageView)
        
        
    }


}


func addRing() -> UIView {
    
    let RingView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
    
    let aDegree = CGFloat.pi / 180
    let lineWidth: CGFloat = 60
    let radius: CGFloat = 150
    let startDegree: CGFloat = 270
    let circlePath = UIBezierPath(ovalIn: CGRect(x: lineWidth , y: 150 + lineWidth, width: radius*2, height: radius*2))
    
    let circleLayer = CAShapeLayer()
    circleLayer.path = circlePath.cgPath
    circleLayer.lineWidth = lineWidth
    circleLayer.strokeColor = CGColor(red: 140/255, green: 0, blue: 0, alpha: 0.3)
    circleLayer.fillColor = UIColor.clear.cgColor

    
    let percentage: CGFloat = 45
    let percentagePath = UIBezierPath(arcCenter: CGPoint(x: lineWidth + radius , y: 150 + lineWidth + radius), radius: radius, startAngle: aDegree * startDegree, endAngle: aDegree * (startDegree + 360 * percentage/100), clockwise: true)
    
    let percentageLayer = CAShapeLayer()
    percentageLayer.path = percentagePath.cgPath
    percentageLayer.strokeColor  = CGColor(red: 140/255, green: 0, blue: 0, alpha: 1)
    percentageLayer.lineWidth = lineWidth
    percentageLayer.fillColor = UIColor.clear.cgColor
  
    let label = UILabel(frame: CGRect(x: 0, y: 150 , width: 2*(lineWidth+radius), height: 2*(lineWidth+radius)))
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 32)
    label.text = "\(percentage/100 * 6000)"
    
    
    let label1 = UILabel(frame: CGRect(x: 0, y: 100 , width: 2*(lineWidth+radius), height: 2*(lineWidth+radius)))
    label1.text = "里程數"
    label1.font = UIFont.systemFont(ofSize: 22)
    label1.textAlignment = .center
    label1.textColor = UIColor(red: 140/255, green: 0, blue: 0, alpha: 1)
    
    let label2 = UILabel(frame: CGRect(x: 0, y: 400 , width: 2*(lineWidth+radius), height: 2*(lineWidth+radius)))
    label2.text = "MUJI購物點數：0 點"
    label2.font = UIFont.systemFont(ofSize: 16)
    label2.textAlignment = .center
    label2.textColor = UIColor.black
    
    let label3 = UILabel(frame: CGRect(x: 0, y: 200 , width: 2*(lineWidth+radius), height: 2*(lineWidth+radius)))
    label3.text = "銅級"
    label3.font = UIFont.systemFont(ofSize: 16)
    label3.textAlignment = .center
    label3.textColor = UIColor.gray
    
    
    RingView.layer.addSublayer(circleLayer)
    RingView.layer.addSublayer(percentageLayer)
    RingView.addSubview(label)
    RingView.addSubview(label1)
    RingView.addSubview(label2)
    RingView.addSubview(label3)
    
    return RingView
   
}


