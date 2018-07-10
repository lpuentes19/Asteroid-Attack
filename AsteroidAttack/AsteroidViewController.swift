//
//  AsteroidViewController.swift
//  AsteroidAttack
//
//  Created by Luis Puentes on 7/5/18.
//  Copyright © 2018 LuisPuentes. All rights reserved.
//

import UIKit
import SpriteKit

class AsteroidViewController: UIViewController {
    
    @IBOutlet weak var asteroidView: AsteroidDropView!
    @IBOutlet weak var asteroidSKView: SKView!
    
    var asteroidScene = AsteroidSKScene()
    var gameTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        let scene = AsteroidSKScene(size: asteroidSKView.bounds.size)
        //scene.scaleMode = .aspectFit
        
        asteroidSKView.presentScene(scene)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //asteroidView.animating = true
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //asteroidView.animating = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func startTimer() {
        gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(addAsteroids), userInfo: nil, repeats: true)
    }
    
    @objc func addAsteroids() {
        asteroidScene.addAsteroids()
    }
}
