//
//  ViewController.swift
//  ThoughBook
//
//  Created by Nikita on 19.03.2022.
//

import UIKit

import UIKit
import RealmSwift

class InitialTableVC: UITableViewController {
    
    
    var bookList: Results<BooksModel>!
    let storageManager = RealmManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookList = storageManager.obtainModel()
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let models = storageManager.obtainModel()
        print("\(models)")

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    //MARK: - UI and some Funcs 
    func setupUI() {
        tableView.register(Cell.self, forCellReuseIdentifier: "CellIdentity")

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addSomeBook))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.blue
        tableView.reloadData()
    }
    
    @objc func addSomeBook() {

        let vc = BookVC()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentity") as! Cell
    
        cell.configure(model: bookList[indexPath.row])
        return cell
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let willDelete = bookList[indexPath.row]
            let realm = try! Realm()
            try! realm.write {
                realm.delete(willDelete)
                DispatchQueue.main.async {
                    tableView.reloadData()

                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
           tableView.deselectRow(at: indexPath, animated: true)
    }
}

