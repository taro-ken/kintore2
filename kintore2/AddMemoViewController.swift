//
//  TodoViewController.swift
//  kintore2
//
//  Created by 木元健太郎 on 2020/09/12.
//  Copyright © 2020 kimoto kentaro. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
// この配列に作ったアイテムを追加していく
var itemArray: [Item] = []

override func viewDidLoad() {
    
    super.viewDidLoad()

    
   
   
}



// セルの数を指定ーitemArrayの配列の数だけCellを表示します
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return itemArray.count
    
}



// Cellの内容を決める
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    //part1で指定した「TodoCell」を引っ張ってくる
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
    //Cell番号のitemArrayを変数Itemに代入
    let item = itemArray[indexPath.row]
    //ToDoCellにCell番号のItemArrayの中身を表示させるようにしている
    cell.textLabel?.text = item.title
    //チェックマークを表示する処理ーitemのdoneがtrueだったら表示falseだったら非表示
    cell.accessoryType = item.done ? .checkmark : .none
    return cell
    
}

// クリックしたらチェックマークが表示される機能
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // 選択されたセルにの中身を代入
    
    let item = itemArray[indexPath.row]
    
    // falseだったらtrue、trueだったらfalseを代入
    item.done = !item.done
    
    // リロードしてUIに反映
    self.tableView.reloadData()
    
}
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "アイテムを追加", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "リストに追加", style: .default) { (action) in
            let newItem: Item = Item(title: textField.text!)
            self.itemArray.append(newItem)
            self.tableView.reloadData()
    }
    
        alert.addTextField { (alertTextField) in
                alertTextField.placeholder = "NEWアイテム"
                textField = alertTextField
            }
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            itemArray.remove(at: indexPath.row)
            let indexPaths = [indexPath]
            tableView.deleteRows(at: indexPaths, with: .automatic)
        }
        
        
        
}
