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
    
    //--------------------------------------------------
    //타이머 시간 = 50분
    //총 남은 시간 = 8시간
    //누적 시간 = 0부터 시작
    
    //타이머 시간
    var Int_seconds: Int = 3000
    //총 남은 시간
    var Int_allTimes: Int = 28800
    //누적 시간
    var Int_sum: Int = 0
    
    var timeTrigger = true
    var realTime = Timer()
    
    
    //-----------------------------------------------------
    // 화면에 들어왔을시 보이는 화면
    override func viewDidLoad() {
        super.viewDidLoad()
        Button_Start_Outlet.layer.cornerRadius=8
        Button_Stop_Outlet.layer.cornerRadius=8
        Button_Restart_Outlet.layer.cornerRadius=8
    }

    @IBAction func Button_Start_Action(_ sender: UIButton) {
        Label_timer.text = "시작"
        if (timeTrigger){
            checkTimeTrigger()
            timeTrigger=false
        }
    }
    @IBAction func Button_Stop_Action(_ sender: UIButton) {
        Label_timer.text = "종료"
        realTime.invalidate()
        timeTrigger = true
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
    
    func checkTimeTrigger(){
        realTime = Timer.scheduledTimer(timeInterval:1, target:self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter(){
        Int_seconds = Int_seconds - 1
        Int_sum = Int_sum + 1
        Int_allTimes = Int_allTimes - 1
        updateShow()
    }
    
    //  타이머의 숫자를 보여주는 부분
    func updateShow(){
        Label_timer.text = printTime(temp:Int_seconds)
        Label_alltime.text = printTime(temp:Int_allTimes)
        Label_stackedTime.text = printTime(temp:Int_sum)
    }
    
    func printTime(temp : Int) -> String{
        
        let second: Int = temp%60
        let hour: Int = temp/3600
        let minute: Int = temp/60 - hour*60
        
        let returnString = String(hour) + ":" + String(minute) + ":" + String(second)
        return returnString
    }
}
