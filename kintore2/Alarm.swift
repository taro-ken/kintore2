//
//  Alarm.swift
//  kintore2
//
//  Created by 木元健太郎 on 2020/08/05.
//  Copyright © 2020 kimoto kentaro. All rights reserved.
//

import Foundation
import AVFoundation
class Alarm{
    var selectedWakeUpTime:Date?
    var audioPlayer: AVAudioPlayer!
    var nowTimer: Timer?
    var count = 0

    
    //secondsが0じゃない場合
         if count != 0{
            //secondsから-1する
            count -= 1
        }else{
            //タイマーを止める
            Timer?.invalidate()
            //タイマーにnil代入
            Timer = nil
            //音源のパス
            let soundFilePath = Bundle.main.path(forResource: "", ofType: "")!
            //パスのURL
            let sound:URL = URL(fileURLWithPath: soundFilePath)
            do {
                //AVAudioPlayerを作成
                audioPlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
            } catch {
                print("Could not load file")
            }
            //再生
            audioPlayer.play()
        }
    }
    
    
    
    

