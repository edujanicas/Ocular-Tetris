//
//  CalibrationViewController.swift
//  Ocular-Tetris
//
//  Created by Eduardo Janicas on 25/06/16.
//  Copyright (c) 2016 EN. All rights reserved.
//

import UIKit
import SpriteKit

class CalibrationViewController: UIViewController, CalibrationDelegate, UIGestureRecognizerDelegate {
    
    var scene: GameScene!
    var calibration: Calibration!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view.
        let skView = view as! SKView
        skView.multipleTouchEnabled = false
        
        // Create and configure the scene
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        scene.tick = didTick
        
        calibration = Calibration()
        calibration.delegate = self
        calibration.beginCalibration()
        
        // Present the scene
        skView.presentScene(scene)
        
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func didTap(sender: AnyObject) {
        // calibration.endCalibration()
    }
    
    func didTick() {
        // calibration.changeContrast()
    }
    
    func calibrationDidBegin(calibration: Calibration) {
        // levelLabel.text = "\(level)"
        // scoreLabel.text = "\(swiftris.score)"
        scene.tickLengthMillis = TickLengthLevelOne
        
        scene.addPreviewShapeToScene(calibration.shape!) {}

    }
    
    func calibrationDidEnd(calibration: Calibration) {
        view.userInteractionEnabled = false
        scene.stopTicking()
    }
    
    func calibrationDidLevelUp(calibration: Calibration) {
        //levelLabel.text = "\(level)"
    }
    
}