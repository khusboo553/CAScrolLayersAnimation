//
//  CAScrollLayerViewController.swift
//  SubCoreanimations
//
//  Created by GLB-311-PC on 05/10/18.
//  Copyright © 2018 Globussoft. All rights reserved.
//

import UIKit

class CAScrollLayerViewController: UIViewController {
    
    var translation: CGFloat = 0.0
    var moveUp : Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()

        if let img = UIImage(named: "sky"), let imgTop = UIImage(named: "train"), let imgParticle = UIImage(named: "steam") { // 1
            let imageSize = img.size
            let layer = CALayer() // 2
            layer.bounds = CGRect(x: 0.0, y: 0.0, width: imageSize.width, height: imageSize.height) // 3
            layer.position = CGPoint(x: imageSize.width/2, y: imageSize.height/2) // 4
            layer.contents = img.cgImage // 5
            view.layer.addSublayer(scrollLayer) // 6
            scrollLayer.addSublayer(layer) // 7
            
            let imageSizeTop = imgTop.size
            let layerTop = CALayer() // 16
            layerTop.bounds = CGRect(x: 0.0, y: 0.0, width: imageSizeTop.width, height: imageSizeTop.height) // 17
            layerTop.position = CGPoint(x: self.view.bounds.size.width/2, y: (self.view.bounds.size.height - imageSizeTop.height/2)) // 18
            layerTop.contents = imgTop.cgImage // 19
            view.layer.addSublayer(scrollLayerTop)  // 20
            scrollLayerTop.addSublayer(layerTop)  // 21
            
            //Add multiple layer
            let emitterLayer = CAEmitterLayer() // 26
            emitterLayer.emitterPosition = CGPoint(x: (layerTop.bounds.width / 2) + 40.0, y: -10.0) // 27
            emitterLayer.emitterShape = kCAEmitterLayerPoint // 28
            
            emitterCell.contents = imgParticle.cgImage // 39
            emitterLayer.emitterCells = [emitterCell ] // 40
            layerTop.addSublayer(emitterLayer) // 41
        }
        displayLink.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)
    }
    @objc func scrollLayerScroll() {
        let newPoint = CGPoint(x: translation, y: 0.0)
        scrollLayer.scroll(newPoint)
        translation += 10.0
        if translation > 1400.0 {
            stopDisplayLink()
        }
        if (moveUp != false) {
            scrollLayerTop.scroll(to: CGPoint(x: 0.0, y: 10.0))
            moveUp = false
        } else {
            scrollLayerTop.scroll(to: CGPoint(x: 0.0, y: -10.0))
            moveUp = true
        }
        
    }
    
    func stopDisplayLink() {
        displayLink.invalidate()
    }
    lazy var emitterCell: CAEmitterCell = {
        let emitterCell : CAEmitterCell = CAEmitterCell() // 29
        emitterCell.scale = 0.1 // 30
        emitterCell.scaleRange = 0.3 // 31
        emitterCell.lifetime = 10.0 // 32
        emitterCell.birthRate = 2 // 33
        emitterCell.velocity = 20 // 34
        emitterCell.velocityRange = 50 // 35
        emitterCell.xAcceleration = -250 // 36
        emitterCell.yAcceleration = -50 // 37
        return emitterCell
    }()
    
    lazy var scrollLayerTop: CAScrollLayer = {
        let scrollLayerTop = CAScrollLayer() // 22
        scrollLayerTop.bounds = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.size.width, height: self.view.bounds.size.height) // 23
        scrollLayerTop.position = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2) // 24
        scrollLayerTop.scrollMode = kCAScrollVertically // 25
        return scrollLayerTop
    }()
    
    lazy var scrollLayer : CAScrollLayer = {
        let scrollLayer = CAScrollLayer() // 8
        //        scrollLayer.bounds = CGRect(x: 0.0, y: 0.0, width: 150.0, height: 300.0) // 9
        scrollLayer.bounds = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.size.width, height:self.view.bounds.size.height) // 9
        scrollLayer.position = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2) // 10
        //        scrollLayer.borderColor = UIColor.black.cgColor // 11
        //        scrollLayer.borderWidth = 5.0 // 12
        scrollLayer.scrollMode = kCAScrollHorizontally // 13
        return scrollLayer
    }()
    
    lazy var displayLink: CADisplayLink = {
        
        let displayLink = CADisplayLink(target: self, selector: #selector(scrollLayerScroll))
        displayLink.preferredFramesPerSecond = 10
        return displayLink
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
