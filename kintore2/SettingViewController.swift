//
//  SettingViewController.swift
//  kintore2
//
//  Created by 木元健太郎 on 2020/08/02.
//  Copyright © 2020 kimoto kentaro. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingArray.count
    }
    

    let settingArray : [Int] = [5,60,120,180,240,300,]
    
    let settingKey = "timer _value"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timerSettingPicker.delegate = self
        timerSettingPicker.dataSource = self
       
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        
        for  row in 0..<settingArray.count {
            if settingArray[row] == timerValue {
                timerSettingPicker.selectRow(row, inComponent: 0, animated: true)
            }
        }
        
        
        
        
        
    }
    

    
    @IBOutlet weak var timerSettingPicker: UIPickerView!
   
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
   
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{return String(settingArray[row])
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let settings = UserDefaults.standard
        settings.setValue(settingArray[row], forKey: settingKey)
        settings.synchronize()
    }
    
    
    
    
}
