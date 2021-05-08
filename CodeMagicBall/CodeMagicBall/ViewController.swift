//
//  ViewController.swift
//  CodeMagicBall
//
//  Created by Brunya on 06.05.2021.
//

import UIKit

final class ViewController: UIViewController {
    
    let imageView = UIImageView()
    let myAnswers = [ #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball4"), #imageLiteral(resourceName: "ball5"), #imageLiteral(resourceName: "ball6") ]
    let myButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addConstraints()
        
    }
    
    @objc private func answersImages() {
     
    imageView.image = myAnswers [ Int.random(in: 0...4)]
    shakeViewAnimation()
    
    }
    
    func shakeViewAnimation() {
        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 3
        shake.autoreverses = true
        
        let fromPoint: CGPoint = CGPoint(x: imageView.center.x - 100, y: imageView.center.y)
        let fromValue: NSValue = NSValue(cgPoint: fromPoint)
        
        let toPoint: CGPoint = CGPoint(x: imageView.center.x + 100, y: imageView.center.y)
        let toValue: NSValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        imageView.layer.add(shake, forKey: "position")
    }
    
        func addConstraints() {
            view.backgroundColor = #colorLiteral(red: 0.3240942955, green: 0.4415765405, blue: 0.9663661122, alpha: 1)
            
            myButton.setTitle("Ask", for: .normal)
            
            myButton.frame = CGRect(x: self.view.center.x, y: self.view.center.y, width: 200, height: 70)
            
            myButton.center = CGPoint(x: self.view.center.x, y: self.view.center.y / 2 + 600)
            
            myButton.backgroundColor = .black
            view.addSubview(myButton)
            view.addSubview(imageView)
            
            imageView.frame = CGRect(x: self.view.center.x, y: self.view.center.y, width: 350, height: 350)
            
            imageView.center = self.view.center
            
            myButton.addTarget(self, action: #selector(answersImages), for: .touchUpInside)

}
    
}

