//
//  AsteroidDropView.swift
//  AsteroidAttack
//
//  Created by Luis Puentes on 7/5/18.
//  Copyright © 2018 LuisPuentes. All rights reserved.
//

import UIKit

class AsteroidDropView: UIView {

    private let asteroidsPerRow = 5
    
    private var asteroidSize: CGSize {
        let size = bounds.size.width / CGFloat(asteroidsPerRow)
        return CGSize(width: size, height: size)
    }
    
    func addAsteroid() {
        var frame = CGRect(origin: CGPoint.zero, size: asteroidSize)
        frame.origin.x = CGFloat.random(max: asteroidsPerRow) * asteroidSize.width
        
        let asteroid = UIView(frame: frame)
        asteroid.backgroundColor = UIColor.random
        
        addSubview(asteroid)
    }
}
