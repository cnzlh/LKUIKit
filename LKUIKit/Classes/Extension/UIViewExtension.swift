//
//  UIViewExtension.swift
//  LKUIKit
//
//  Created by zhulinhua on 2018/7/9.
//

import Foundation

import UIKit

extension UIView {
    //将当前视图转为UIImage
    func asImage() -> UIImage? {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            // Fallback on earlier versions
            UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0.0)
            if UIGraphicsGetCurrentContext() != nil {
                drawHierarchy(in: bounds, afterScreenUpdates: true)
                let screenshot = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                return screenshot
            }
            return nil
        }
    }
}
