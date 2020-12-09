//
//  SecondViewController.swift
//  kintore2
//
//  Created by 木元健太郎 on 2020/07/26.
//  Copyright © 2020 kimoto kentaro. All rights reserved.
//

import UIKit
import AVFoundation

class TimerViewController: UIViewController, AVAudioPlayerDelegate {
    
    var samplePlayer:AVAudioPlayer!


    //タイマーの変数を作成
    var timer :Timer?
    //カウントの変数を作成
    var count = 0
    //設定を扱うキーを作成
    let settingKey = "timer _value"
    
   

   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let settings = UserDefaults
        .standard
        
        settings.register(defaults: [settingKey:10])
    }

    @IBOutlet weak var countDownLabel: UILabel!
    
    @IBAction func settingButtomAction(_ sender: Any) {
        
        if let nowTimer = timer {
            if nowTimer.isValid == true {
                
                nowTimer.invalidate()
            }
        }
       //画面推移
        performSegue(withIdentifier: "goSetting", sender: nil)
        
    }
    
    @IBAction func startButtomAction(_ sender: Any) {
        if let nowTimer = timer {
            
            if nowTimer.isValid == true {
                return
            }
        }
        //タイマースタート
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,selector: #selector(self.timerInterrupt(_:)),
        userInfo: nil,
        repeats: true)
    }
    
    @IBAction func stopButtomAction(_ sender: Any) {
        
        if let nowTimer = timer {
            if nowTimer.isValid == true{
                nowTimer.invalidate()
        }
    }
        
    }
    
    func displayUpdate() -> Int {
        
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey:settingKey)
    let remainCount = timerValue - count
        countDownLabel.text = " \(remainCount)秒"
    return remainCount
    
    }
    //経過時間の処理
    @objc func timerInterrupt(_ timer:Timer){
        
        count += 1
        //残り時間がゼロ以下の時、タイマーを止める
        if displayUpdate() <= 0 {
            //初期化処理
            count = 0
            //タイマー停止
            timer.invalidate()
            
            //ダイアログ作成
            let alertController = UIAlertController(title: "終了", message: "タイマー終了！さあ、頑張ろう！", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alertController.addAction(defaultAction)
            
            // ここで音を鳴らす
          
            let samplePath = Bundle.main.path(forResource: "sample", ofType: "mp3")!
            //パスのURL
            let sound:URL = URL(fileURLWithPath: samplePath)
            do {
                //AVAudioPlayerを作成
                samplePlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
            } catch {
                print("Could not load file")
            }
            //再生
            samplePlayer.play()
            
        
            }
        }
    
    override func viewDidAppear(_ animated: Bool) {
    count = 0
    _ = displayUpdate()
    }

            
}
           

            
    
    




