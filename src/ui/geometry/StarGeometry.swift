//
//  StarNode.swift
//  GalaxyKit
//
//  Created by Ryan Arana on 12/28/15.
//  Copyright © 2015 Aranasaurus. All rights reserved.
//

import Foundation
import SceneKit

public extension Star {
    public func createMaterial() -> SCNMaterial {
        let m = SCNMaterial()
        
        m.locksAmbientWithDiffuse = true
        m.diffuse.contents = color
        
        m.cullMode = .back
        return m
    }
    
    public class Geometry: SCNSphere {
        
        public init(star: Star) {
            super.init()
            
            configureForStar(star)
        }

        public required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        public func configureForStar(_ star: Star) {
            radius = CGFloat(star.radius)
            materials = [star.createMaterial()]
        }
    }
}