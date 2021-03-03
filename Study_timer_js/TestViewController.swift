//
//  TestViewController.swift
//  Study_timer_js
//
//  Created by 이준석 on 2021/02/25.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var test_label: UILabel!
    
    override func viewDidLoad() {
        //test_label.alpha = 0
        //test_label.transform = CGAffineTransform(translationX: 0, y: 50)
        self.test_label.transform = CGAffineTransform(scaleX: 1, y: 1)
        super.viewDidLoad()
    }
    
    @IBAction func button_animation(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5,
                       animations:{
            //self.test_label.alpha = 1000
            //self.test_label.transform = CGAffineTransform(translationX: 0, y: 0)
                        self.test_label.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        })
    }
    
    

}
