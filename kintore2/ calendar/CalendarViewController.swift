//
//  CalendarViewController.swift
//  kintore2
//
//  Created by 木元健太郎 on 2020/09/14.
//  Copyright © 2020 kimoto kentaro. All rights reserved.
//

import UIKit
import FSCalendar
import Realm
import RealmSwift
import CalculateCalendarLogic

class CalendarViewController: UIViewController,FSCalendarDelegateAppearance {
    
    var diaryArray: [Diary] = []
   
    
    
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var diaryTitleTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        calendar.delegate = self
        calendar.dataSource = self

        configureTableView()

        diaryArray = Diary.search(date: Date())
        
        
        
        
        
        // MARK: データ全削除 - 初期化テスト用
         // 以前とモデルの構造が違う場合にはマイグレーションが必要だが、そのかわりに一度全データを削除する
//           let realmURL = Realm.Configuration.defaultConfiguration.fileURL!
//         let realmURLs = [
//            realmURL,
//            realmURL.appendingPathExtension("lock"),
//            realmURL.appendingPathExtension("note"),
//            realmURL.appendingPathExtension("management")
//           ]
//           for URL in realmURLs {
//             do {
//                try FileManager.default.removeItem(at: URL)
//              } catch {
//                
//            }
//        }
        
        

    }
    
    @IBAction func add(_ sender: Any) {
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    

    // 祝日判定を行い結果を返すメソッド(True:祝日)
    func judgeHoliday(_ date : Date) -> Bool {
        //祝日判定用のカレンダークラスのインスタンス
        let tmpCalendar = Calendar(identifier: .gregorian)

        // 祝日判定を行う日にちの年、月、日を取得
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)

        // CalculateCalendarLogic()：祝日判定のインスタンスの生成
        let holiday = CalculateCalendarLogic()

        return holiday.judgeJapaneseHoliday(year: year, month: month, day: day)
    }
    // date型 -> 年月日をIntで取得
    func getDay(_ date:Date) -> (Int,Int,Int){
        let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)
        return (year,month,day)
    }

    //曜日判定(日曜日:1 〜 土曜日:7)
    func getWeekIdx(_ date: Date) -> Int{
        let tmpCalendar = Calendar(identifier: .gregorian)
        return tmpCalendar.component(.weekday, from: date)
    }

    // 土日や祝日の日の文字色を変える
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        //祝日判定をする（祝日は赤色で表示する）
        if self.judgeHoliday(date){
            return UIColor.red
        }

        //土日の判定を行う（土曜日は青色、日曜日は赤色で表示する）
        let weekday = self.getWeekIdx(date)
        if weekday == 1 {   //日曜日
            return UIColor.red
        }
        else if weekday == 7 {  //土曜日
            return UIColor.blue
        }

        return nil
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            diaryArray = Diary.search(date: Date())
            diaryTitleTableView.reloadData()
        }


        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toDetail" {
                let detailDiaryViewController = segue.destination as! DetailDairyViewController
                let selectedIndex = diaryTitleTableView.indexPathForSelectedRow!
                detailDiaryViewController.selectedDiary = diaryArray[selectedIndex.row]
            }
        }

        // Private
        func configureTableView() {
            //dataSourceとdelegateメソッドが使えるように。
            diaryTitleTableView.delegate = self
            diaryTitleTableView.dataSource = self

            //セルの高さを30.0で固定
            diaryTitleTableView.rowHeight = 30.0

            //余白を消す
            diaryTitleTableView.tableFooterView = UIView()
        }


    }

    extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
        
        
        

        // MARK: - TableView DataSource
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return diaryArray.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "diaryCell")!

            cell.textLabel?.text = diaryArray[indexPath.row].title

            return cell
            
            
        }

        // MARK: - TableView Delegate
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
        }
        //スワイプしてセルを削除
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == UITableViewCell.EditingStyle.delete {

                // MARK:-　追加 - 指定された行を削除する
                // 削除したい行に相当するオブジェクトを渡し、削除
                Diary.remove(diaryArray[indexPath.row])
                // 再度 diaryArray を読み込み
                diaryArray = Diary.search(date: Date())

                // 削除のアニメーションを実施する
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            }
        }
        

}
        
        extension CalendarViewController: FSCalendarDataSource, FSCalendarDelegate {
        // MARK: - FSCalendar Delegate
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            //日付選択時に呼ばれるメソッド
            diaryArray = Diary.search(date: date)
            diaryTitleTableView.reloadData()
            
            
            
            let tmpDate = Calendar(identifier: .gregorian)
            _ = tmpDate.component(.year, from: date)
            _ = tmpDate.component(.month, from: date)
            _ = tmpDate.component(.day, from: date)
           
        }
    
}
    



