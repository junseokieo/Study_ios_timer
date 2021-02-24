//
//  ViewController.swift
//  Study_timer_js
//
//  Created by 이준석 on 2021/02/10.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    //-------------------------------------------------
    @IBOutlet weak var Focus_percent: UILabel!
    @IBOutlet weak var Label_alltime: UILabel!
    @IBOutlet weak var Label_stackedTime: UILabel!
    @IBOutlet weak var Label_timer: UILabel!
    
    @IBOutlet weak var Button_Start_Outlet: UIButton!
    @IBOutlet weak var Button_Stop_Outlet: UIButton!
    @IBOutlet weak var Button_Restart_Outlet: UIButton!
    @IBOutlet weak var Button_reset_Outlet: UIButton!
    @IBOutlet weak var Button_timeset_Outlet: UIButton!
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
    
    let clicked_button = UIColor(named: "clicked_color")
    let button_color = UIColor(named: "button_color")
    //-----------------------------------------------------
    // 화면에 들어왔을시 보이는 화면
    override func viewDidLoad() {
        super.viewDidLoad()
        Button_Start_Outlet.layer.cornerRadius=8
        Button_Stop_Outlet.layer.cornerRadius=8
        Button_Restart_Outlet.layer.cornerRadius=8
    }

    @IBAction func Button_Start_Action(_ sender: UIButton) {
        //Label_timer.text = "시작"
        if (timeTrigger){
            checkTimeTrigger()
            timeTrigger=false
        }
        // 실행 됐을 때 버튼색을 바꾼다.
        startColor()
        // start를 눌렀을 때 restart와 start는 비활성화, stop은 활성화
        // 시작 시에 리셋은 작동 금지
        buttonStarted()
    }
    @IBAction func Button_Stop_Action(_ sender: UIButton) {
        //Label_timer.text = "종료"
        endGame()
        // 중단 했을 때 버튼 색을 바꾼다.
        stopColor()
        // stop을 눌렀을 때 start와 restart만 활성화. stop은 비활성화.
        buttonStopped()
    }
    @IBAction func Button_Restart_Action(_ sender: UIButton) {
        //Label_timer.text = "재시작"
        
        Button_Stop_Outlet.backgroundColor = button_color
        Button_Start_Outlet.backgroundColor = button_color
        
        Button_Stop_Outlet.isUserInteractionEnabled = true
        Button_Start_Outlet.isUserInteractionEnabled = true
        
        Int_seconds = 5
        updateShow()
    }
    @IBAction func Button_Reset_Action(_ sender: UIButton) {
        //Label_timer.text = "리셋"
        getTimeData()
        updateShow()
    }
    @IBAction func Button_Timeset_Action(_ sender: UIButton) {
        Label_timer.text = "시간설정"
    }
    
    func checkTimeTrigger(){
        realTime = Timer.scheduledTimer(timeInterval:1, target:self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter(){
        // 종료하게 되는 경우
        // 타이머 시간이 종료된 경우
        if Int_seconds < 1{
            endGame()
            buttonStopped()
            stopColor()
            AudioServicesPlaySystemSound(1254) //진동
            AudioServicesPlaySystemSound(4095) //특정 소리
        }
        // 남은 시간이 모두 종료된 경우
        else if Int_allTimes < 1 {
            endGame()
            buttonStopped()
            stopColor()
        }else{
            Int_seconds = Int_seconds - 1
            Int_sum = Int_sum + 1
            Int_allTimes = Int_allTimes - 1
        }
        updateShow()
    }
    
    //  타이머의 숫자를 보여주는 부분
    func updateShow(){
        Label_timer.text = printTime(temp:Int_seconds)
        Label_alltime.text = printTime(temp:Int_allTimes)
        Label_stackedTime.text = printTime(temp:Int_sum)
    }
    
    func printTime(temp : Int) -> String{
        
        let S: Int = temp%60
        let H: Int = temp/3600
        let M: Int = temp/60 - H*60
        // 삼항 연산자를 이용하여 만약 10보다 작은 경우 0을 추가하여 출력하겠다.
        let stringS = S<10 ? "0" + String(S) : String(S)
        let stringM = M<10 ? "0" + String(M) : String(M)
        let stringH = H<10 ? "0" + String(H) : String(H)
        
        let returnString = stringH + ":" + stringM + ":" + stringS
        return returnString
    }
    
    func endGame(){
        realTime.invalidate()
        timeTrigger = true
    }
    
    func startColor(){
        Button_Start_Outlet.backgroundColor =  clicked_button
        Button_Stop_Outlet.backgroundColor = button_color
        Button_Restart_Outlet.backgroundColor = clicked_button
    }
    
    func stopColor(){
        Button_Start_Outlet.backgroundColor =  button_color
        Button_Stop_Outlet.backgroundColor = clicked_button
        Button_Restart_Outlet.backgroundColor = button_color
    }
    
    func buttonStarted(){
        Button_Start_Outlet.isUserInteractionEnabled = false
        Button_Stop_Outlet.isUserInteractionEnabled = true
        Button_Restart_Outlet.isUserInteractionEnabled = false
        // 리셋, 타임 셋 활성화
        Button_reset_Outlet.isUserInteractionEnabled = false
        Button_timeset_Outlet.isUserInteractionEnabled = false
    }
    
    func buttonStopped(){
        Button_Start_Outlet.isUserInteractionEnabled = true
        Button_Stop_Outlet.isUserInteractionEnabled = false
        Button_Restart_Outlet.isUserInteractionEnabled = true
        // 리셋, 타임 셋 활성화
        Button_reset_Outlet.isUserInteractionEnabled = true
        Button_timeset_Outlet.isUserInteractionEnabled = true
    }
    // 저장된 시간을 불러오는 메소드
    // 시간을 재 설정 해주는 메소드
    func getTimeData(){
        Int_seconds=3000
        Int_sum=0
        Int_allTimes=28800
    }
}
