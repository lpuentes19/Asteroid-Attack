//
//  AsteroidDropView.swift
//  AsteroidAttack
//
//  Created by Luis Puentes on 7/5/18.
//  Copyright © 2018 LuisPuentes. All rights reserved.
//

import UIKit

class AsteroidDropView: UIView {
    
    private let gravity = UIGravityBehavior()
    private lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: self)
    private let asteroidsPerRow = 5
    
    var animating: Bool = false {
        didSet {
            if animating {
                animator.addBehavior(gravity)
            } else {
                animator.removeBehavior(gravity)
            }
        }
    }
    
    var asteroidImage = UIImage(named: "asteroid")
    var asteroidImageView: UIImageView!
    
    private var asteroidSize: CGSize {
        let size = bounds.size.width / CGFloat(asteroidsPerRow)
        return CGSize(width: size, height: size)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    private func customInit() {
        self.backgroundColor = UIColor.black
    }
    
    @objc func hi(recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            addAsteroid()
            print("It WORKS!!!!!")
        }
    }
    
    func addAsteroid() {
        var frame = CGRect(origin: CGPoint.zero, size: asteroidSize)
        frame.origin.x = CGFloat.random(max: asteroidsPerRow) * asteroidSize.width
        
        asteroidImageView = UIImageView(image: asteroidImage)
        asteroidImageView.contentMode = .scaleAspectFill
        asteroidImageView.frame = frame
        asteroidImageView.isUserInteractionEnabled = true
        
        asteroidImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hi(recognizer:))))
        
        addSubview(asteroidImageView)
        gravity.addItem(asteroidImageView)
    }
}
