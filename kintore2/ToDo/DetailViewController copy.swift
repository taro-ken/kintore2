//
//  DetailViewController.swift
//  
//
//  Created by 木元健太郎 on 2020/09/20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var memoTextView: UITextView!

        var selectedRow:Int!
        var selectedMemo : String!

        override func viewDidLoad() {
            super.viewDidLoad()

           memoTextView.text = selectedMemo
        }

        @IBAction func deleteMemo(_ sender: Any) {
            let ud = UserDefaults.standard
            if ud.array(forKey: "memoArray") != nil{
                var saveMemoArray = ud.array(forKey: "memoArray") as![String]
                saveMemoArray.remove(at: selectedRow)
                ud.set(saveMemoArray, forKey: "memoArray" )
                ud.synchronize()
                //画面遷移

                self.navigationController?.popViewController(animated: true)
            }
        }
    }
