//
//  ViewController.swift
//  fdjkkfjdjfdfjdkf
//
//  Created by Mac on 2/9/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scroller: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 0..<10 {
            
            let customView = UIView(frame: CGRect(x: i * 240 , y: 0, width: 240, height: 128))
            // .random is unimportant here
            customView.backgroundColor =  i % 2 == 0 ? UIColor.green : UIColor.red
            scroller.addSubview(customView)
            
        }
        
    }
    
    override func viewDidLayoutSubviews(){
        self.scroller.contentSize = CGSize(width:2400,height:128)
        print(self.scroller.contentSize) // 2400
       // print(self.stack.subviews)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollin'")
    }


}

