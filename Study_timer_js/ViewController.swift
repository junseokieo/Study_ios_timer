//
//  ViewController.swift
//  Study_timer_js
//
//  Created by 이준석 on 2021/02/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Focus_percent: UILabel!
    @IBOutlet weak var Label_alltime: UILabel!
    @IBOutlet weak var Label_stackedTime: UILabel!
    @IBOutlet weak var Label_timer: UILabel!
    
    @IBOutlet weak var Button_Start_Outlet: UIButton!
    @IBOutlet weak var Button_Stop_Outlet: UIButton!
    @IBOutlet weak var Button_Restart_Outlet: UIButton!
    
    
    // 화면에 들어왔을시 보이는 화면
    override func viewDidLoad() {
        super.viewDidLoad()
        Button_Start_Outlet.layer.cornerRadius=8
        Button_Stop_Outlet.layer.cornerRadius=8
        Button_Restart_Outlet.layer.cornerRadius=8
    }

    @IBAction func Button_Start_Action(_ sender: UIButton) {
        Label_timer.text = "시작"
    }
    @IBAction func Button_Stop_Action(_ sender: UIButton) {
        Label_timer.text = "종료"
    }
    @IBAction func Button_Restart_Action(_ sender: UIButton) {
        Label_timer.text = "재시작"
    }
    @IBAction func Button_Reset_Action(_ sender: UIButton) {
        Label_timer.text = "리셋"
    }
    @IBAction func Button_Timeset_Action(_ sender: UIButton) {
        Label_timer.text = "시간설정"
    }
}

