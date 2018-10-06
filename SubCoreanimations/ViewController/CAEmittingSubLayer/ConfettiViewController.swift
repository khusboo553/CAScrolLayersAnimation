//
//  ConfettiViewController.swift
//  SubCoreanimations
//
//  Created by GLB-311-PC on 06/10/18.
//  Copyright © 2018 Globussoft. All rights reserved.
//

import UIKit

class ConfettiViewController: UIViewController {
    private let dimension = 6
    private var velocities = [50, 100, 150, 200,70,80]
    private var imagesNames = ["like", "comment", "follow", "followLove","facebook","profile"]
    private var colors: [UIColor] = [.white, .white, .white, .white,.white,.white]
    
    private let rootLayer = CALayer()
    private let confettiViewEmitterLayer = CAEmitterLayer()
    private let confettiViewEmitterCell = CAEmitterCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        // Do any additional setup after loading the view.
    }
    private func commonInit() {
       
        setupRootLayer()
        setupConfettiEmitterLayer()
        
        confettiViewEmitterLayer.emitterCells = generateConfettiEmitterCells()
        rootLayer.addSublayer(confettiViewEmitterLayer)
        self.view.layer.addSublayer(rootLayer)
    }
    // MARK: - Setup Layers
    private func setupRootLayer() {
        rootLayer.backgroundColor = UIColor.white.cgColor
    }
    
    private func setupConfettiEmitterLayer() {
        confettiViewEmitterLayer.emitterSize = CGSize(width: self.view.bounds.size.width, height: 2)
        confettiViewEmitterLayer.emitterShape = kCAEmitterLayerLine
        confettiViewEmitterLayer.emitterPosition = CGPoint(x: self.view.bounds.size.width / 2, y:self.view.bounds.size.height)
    }
    
    // MARK: - Generator
    private func generateConfettiEmitterCells() -> [CAEmitterCell] {
        var cells = [CAEmitterCell]()
        
        for index in 0..<5 {
            let cell = CAEmitterCell()
            cell.color = nextColor(i: index)
            cell.contents = nextImage(i: index)
            cell.birthRate = 2.0
            cell.lifetime = 5.0
            cell.lifetimeRange = 0
            cell.scale = 0.1
            cell.scaleRange = 0.25
            cell.velocity = -CGFloat(randomVelocity)
            cell.velocityRange = 0
            cell.emissionLongitude = CGFloat.pi
            cell.emissionRange = 0.5
            cell.spin = 3.5
            cell.spinRange = 1
            
            cells.append(cell)
        }
        
        return cells
    }
    
    // MARK: - Helpers
    var randomNumber: Int {
        return Int(arc4random_uniform(UInt32(dimension)))
    }
    
    var randomVelocity: Int {
        return velocities[randomNumber]
    }
    
    private func nextColor(i: Int) -> CGColor {
        return colors[i % dimension].cgColor
    }
    
    private func nextImage(i: Int) -> CGImage? {
        let imgConfitt = UIImage(named: imagesNames[i % dimension])
        return imgConfitt?.cgImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
