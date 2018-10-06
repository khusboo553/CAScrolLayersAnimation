//
//  SnowEffectViewController.swift
//  SubCoreanimations
//
//  Created by GLB-311-PC on 05/10/18.
//  Copyright © 2018 Globussoft. All rights reserved.
//

import UIKit

class SnowEffectViewController: UIViewController {
    private let rootLayer = CALayer()
    private let snowflakeEmitterLayer = CAEmitterLayer()
    private let snowflakeEmitterCell = CAEmitterCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        // Do any additional setup after loading the view.
    }
    private func commonInit() {
//        wantsLayer = true
//        layer = rootLayer
        
        setupRootLayer()
        setupSnowflakeEmitterLayer()
        setupSnowflakeEmitterCell()
        
        snowflakeEmitterLayer.emitterCells = [snowflakeEmitterCell]
        rootLayer.addSublayer(snowflakeEmitterLayer)
        self.view.layer.addSublayer(rootLayer)
    }
    // MARK: - Setup Layers
    private func setupRootLayer() {
        rootLayer.backgroundColor = self.view.backgroundColor?.cgColor
//            UIColor(currentColorSchemeHex: 0x70a3bc).cgColor
    }
    
    private func setupSnowflakeEmitterLayer() {
        snowflakeEmitterLayer.emitterSize = self.view.bounds.size
        //way the particles float
        snowflakeEmitterLayer.emitterShape = kCAEmitterLayerSphere
        //particle comes from which position x and y
        snowflakeEmitterLayer.emitterPosition = CGPoint(x:self.view.bounds.size.width/2, y: self.view.bounds.size.height)
    }
    
    private func setupSnowflakeEmitterCell() {
        snowflakeEmitterCell.color = UIColor.white.cgColor
        let imgSmoke = UIImage(named: "whiteSnow")
        snowflakeEmitterCell.contents = imgSmoke?.cgImage
        snowflakeEmitterCell.lifetime = 5.5
        snowflakeEmitterCell.birthRate = 100
        snowflakeEmitterCell.blueRange = 0.15
        snowflakeEmitterCell.alphaRange = 0.4
        snowflakeEmitterCell.velocity = 10
        snowflakeEmitterCell.velocityRange = 300
        snowflakeEmitterCell.scale = 0.4
        snowflakeEmitterCell.scaleRange = 1.3
        snowflakeEmitterCell.emissionRange = CGFloat.pi / 2
        snowflakeEmitterCell.emissionLongitude = CGFloat.pi
        snowflakeEmitterCell.yAcceleration = -70
        snowflakeEmitterCell.scaleSpeed = -0.1
        snowflakeEmitterCell.alphaSpeed = -0.05
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
