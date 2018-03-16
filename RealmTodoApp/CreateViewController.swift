//
//  CreateViewController.swift
//  RealmTodoApp
//
//  Created by 真田雄太 on 2018/03/15.
//  Copyright © 2018年 yutaSanada. All rights reserved.
//

import UIKit
import RealmSwift

class CreateViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self as! UITextFieldDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createButton(_ sender: Any) {
        let realm = try! Realm() //realmのインスタンス化
        
        let todo = Todo() //todoクラスのインスタンス化
        todo.title = textField.text!
        try! realm.write{
            realm.add(todo)
        }//realmにデータ書き込み
        self.dismiss(animated: true, completion: nil) //前の画面に戻る
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }
    
   

}
