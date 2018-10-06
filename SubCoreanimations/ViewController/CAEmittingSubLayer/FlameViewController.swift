//
//  FlameViewController.swift
//  SubCoreanimations
//
//  Created by GLB-311-PC on 06/10/18.
//  Copyright © 2018 Globussoft. All rights reserved.
//

import UIKit

class FlameViewController: UIViewController {
    private let rootLayer = CALayer()
    private let flameEmitterLayer = CAEmitterLayer()
    private let flameEmitterCell = CAEmitterCell()

    override func viewDidLoad() {
        super.viewDidLoad()
       commonInit()
        // Do any additional setup after loading the view.
    }
    
    private func commonInit() {
        setupRootLayer()
        setupFlameEmitterLayer()
        setupFlameEmitterCell()
        
        flameEmitterLayer.emitterCells = [flameEmitterCell]
        rootLayer.addSublayer(flameEmitterLayer)
        self.view.layer.addSublayer(rootLayer)
    }
    
    // MARK: - Setup Layers
    private func setupRootLayer() {
        rootLayer.backgroundColor = self.view.backgroundColor?.cgColor
    }
    
 
    private func setupFlameEmitterLayer() {
        flameEmitterLayer.emitterSize = self.view.bounds.size
        flameEmitterLayer.emitterPosition = CGPoint(x: self.view.bounds.size.width/2, y:self.view.bounds.size.height/2)
        //kCAEmitterLayerAdditive==>The particles are rendered using source-additive compositing.
        flameEmitterLayer.renderMode = kCAEmitterLayerAdditive
    }
    
    private func setupFlameEmitterCell() {
        flameEmitterCell.color = UIColor(red: 1, green: 0.5, blue: 0.2, alpha: 1.0).cgColor
        let imgSpark = UIImage(named: "spark")
        flameEmitterCell.contents = imgSpark?.cgImage
        flameEmitterCell.lifetime = 5.0
        flameEmitterCell.birthRate = 150
        flameEmitterCell.alphaSpeed = -0.4
        flameEmitterCell.velocity = 50
        flameEmitterCell.velocityRange = 50
        flameEmitterCell.emissionRange = CGFloat.pi * 2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
