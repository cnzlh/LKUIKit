//
//  MBProgressHUDExtBundle.swift
//  LKUIKit
//
//  Created by zhulinhua on 2018/6/14.
//

import Foundation
import UIKit

class MBProgressHUDExtBundle {
    
    var mbBundle : Bundle
    
    init(bundle: Bundle) {
        mbBundle = bundle
    }
    
    static func bundle(name: String, for aClass: Swift.AnyClass) -> MBProgressHUDExtBundle? {
        let bundle = Bundle(for: aClass)
        if let path = bundle.path(forResource: name, ofType: "bundle") {
            if let bundle = Bundle(path: path) {
                return MBProgressHUDExtBundle(bundle: bundle)
            }
        }
        return nil
    }
    
    func imageFromBundle(_ imageName: String) -> UIImage? {
        var imageName = imageName
        if UIScreen.main.scale == 2 {
            imageName = imageName + "@2x"
        }else if UIScreen.main.scale == 3 {
            imageName = imageName + "@3x"
        }
        let bundle = Bundle(path: mbBundle.bundlePath)
        if let path = bundle?.path(forResource: imageName, ofType: "png") {
            let image = UIImage(contentsOfFile: path)
            return image
        }
        return nil
    }
    
}
