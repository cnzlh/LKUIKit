//
//  MBProgressHUDExt.swift
//  LKUIKit
//
//  Created by zhulinhua on 2018/6/14.
//

import Foundation
import MBProgressHUD

extension MBProgressHUD {
    
    static let mbBundle = MBProgressHUDExtBundle.bundle(name: "MBProgressHUDEXT", for: MBProgressHUDExtBundle.self)
    
    //显示等待消息
    public class func showWait(_ title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
    }
    
    //显示普通消息
    public class func showInfo(_ title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        let imageView = UIImageView.init()
        imageView.image = mbBundle?.imageFromBundle("info")
        
        hud.customView = imageView //自定义视图显示图片
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: 3)
    }
    
    //显示成功消息
    public class func showSuccess(_ title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        if let image = MBProgressHUD.imageFromBundle("success") {
            hud.customView = UIImageView(image: image) //自定义视图显示图片
        }
//        hud.customView = UIImageView(image: UIImage(named: "success")!) //自定义视图显示图片
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
        //HUD窗口显示1秒后自动隐藏
        hud.hide(animated: true, afterDelay: 1)
    }
    
    //显示失败消息
    public class func showError(_ title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        if let image = MBProgressHUD.imageFromBundle("error") {
            hud.customView = UIImageView(image: image) //自定义视图显示图片
        }
//        hud.customView = UIImageView(image: UIImage(named: "error")!) //自定义视图显示图片
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
        //HUD窗口显示1秒后自动隐藏
        hud.hide(animated: true, afterDelay: 1)
    }
    
    //获取用于显示提示框的view
    class func viewToShow() -> UIView {
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != UIWindowLevelNormal {
            let windowArray = UIApplication.shared.windows
            for tempWin in windowArray {
                if tempWin.windowLevel == UIWindowLevelNormal {
                    window = tempWin;
                    break
                }
            }
        }
        return window!
    }
    
    static func imageFromBundle(_ imageName: String) -> UIImage? {
        var imageName = imageName
        if UIScreen.main.scale == 2 {
            imageName = imageName + "@2x"
        }else if UIScreen.main.scale == 3 {
            imageName = imageName + "@3x"
        }
        let bundle = Bundle(for: MBProgressHUD.self)
        if let path = bundle.path(forResource: "MBProgressHUDExt", ofType: "bundle") {
            if let bundle = Bundle(path: path) {
                if let file = bundle.path(forResource: imageName, ofType: "png") {
                    let image = UIImage(contentsOfFile: file)
                    return image
                }
            }
        }
        
        return nil
    }
}
