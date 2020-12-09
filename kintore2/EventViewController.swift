//
//  EventViewController.swift
//  kintore2
//
//  Created by 木元健太郎 on 2020/09/14.
//  Copyright © 2020 kimoto kentaro. All rights reserved.
//

import UIKit
import RealmSwift

class EventViewController: UIViewController {

    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var memoTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func createEvent(success: @escaping () -> Void) {
        do {
            let realm = try Realm()
            let eventModel = EventModel()
            eventModel.title = titleTextField.text ?? ""
            eventModel.memo = memoTextView.text
            
            
            try realm.write {
                realm.add(eventModel)
                success()
            }
        } catch {
            print("create todo error.")
        }
    }
    

}
