//
//  AsteroidViewController.swift
//  AsteroidAttack
//
//  Created by Luis Puentes on 7/5/18.
//  Copyright © 2018 LuisPuentes. All rights reserved.
//

import UIKit

class AsteroidViewController: UIViewController {

    @IBOutlet weak var asteroidView: AsteroidDropView! {
        didSet {
            asteroidView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addAsteroid(recognizer:))))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func addAsteroid(recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            asteroidView.addAsteroid()
        }
    }
}
