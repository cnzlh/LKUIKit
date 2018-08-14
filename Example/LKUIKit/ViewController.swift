//
//  ViewController.swift
//  LKUIKit
//
//  Created by zhulinhua on 04/12/2018.
//  Copyright (c) 2018 zhulinhua. All rights reserved.
//

import UIKit
import LKUIKit
import MBProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var count: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib.init(nibName: "RefreshCell", bundle: nil), forCellReuseIdentifier: "RefreshCell")
        tableView.cr.addHeadRefresh(animator: NormalHeaderAnimator() as CRRefreshProtocol) { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self?.count = 10
                self?.tableView.cr.endHeaderRefresh()
                self?.tableView.cr.resetNoMore()
                self?.tableView.reloadData()
            })
        }
    }

}

// MARK: - Table view data source
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // MBProgressHUD.showWait("请稍等")
//        MBProgressHUD.showInfo("这是普通提示消息")
        
        self.view.makeToast("didSelectRowAt at \(indexPath)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RefreshCell", for: indexPath) as! RefreshCell
        return cell
    }
    
}
