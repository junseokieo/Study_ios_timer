//
//  ViewController.swift
//  Study_timer_js
//
//  Created by 이준석 on 2021/02/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label_hello: UILabel!
    @IBOutlet weak var Text_num: UITextField!
    @IBOutlet weak var Text_name: UITextField! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Button_click(_ sender: UIButton) {
        //Label_hello.text = "Button clicked !!"
        // 버튼을 클릭했을시 학번, 이름이 나오도록.
        Label_hello.text = "학번 : " + Text_num.text! + "\n이름: " + Text_name.text!
        
    }

}

