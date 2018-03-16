//
//  TableViewController.swift
//  RealmTodoApp
//
//  Created by 真田雄太 on 2018/03/15.
//  Copyright © 2018年 yutaSanada. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
    let realm = try! Realm() //realmのインスタンス化
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "create", style: .plain, target: self, action: #selector(self.create))
    }
    
    func create() {
        performSegue(withIdentifier: "create", sender: nil)
    }
    
    @IBAction func unWindToTop(segue: UIStoryboardSegue) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let todoCollection = realm.objects(Todo.self) //realmに保存されたTodo型オブジェクトの取得
        
        return todoCollection.count //realmオブジェクトの数を取得
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let todoCollection = realm.objects(Todo.self)
        let todo = todoCollection[indexPath.row]
        cell.textLabel?.text = todo.title
        
        return cell
    }
 

    

    

    

}
