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
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        asteroidView.animating = true
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        asteroidView.animating = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func startTimer() {
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(addAsteroids), userInfo: nil, repeats: true)
    }
    
    @objc func addAsteroids() {
        asteroidView.addAsteroid()
    }
}
