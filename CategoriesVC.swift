//
//  CategoriesVC.swift
//  InstagramApp
//
//  Created by mueen on 13/05/2020.
//  Copyright © 2020 mueen. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
     
    
    @IBOutlet weak var hashtagCategoriesTableView: UITableView!
    
    var seletedHashtag: String!
    
    
    struct userDetails1 {
        var username1:String
        
    }
    
   
    
    var hashtagArray = [userDetails1]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //firstMessagePopUp1()
        hashtagCategoriesTableView.dataSource = self
        hashtagCategoriesTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    /*func firstMessagePopUp1() {
           let alertController3 = UIAlertController(title: "Click on + in top right corner to add a new Tag", message: nil, preferredStyle: .alert)
           let confirmAction = UIAlertAction(title: "Ok", style: .default) { (_) in
           }
           
           alertController3.addAction(confirmAction)
           self.present(alertController3, animated: true, completion: nil)
       }*/
   
    func showAlertWithTextField1() {
        let alertController = UIAlertController(title: "Add new Category", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Add", style: .default) { (_) in
            if let txtField = alertController.textFields?.first, let text = txtField.text {
                // operations
                print("Text==>" + text)
                
                let data1 = userDetails1(username1: text)
                self.hashtagArray.append(data1)
                self.hashtagCategoriesTableView.reloadData()
            }
        
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addTextField { (textField) in
            textField.placeholder = "New Category"
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let hashVC = segue.destination as! hashtagViewController
        hashVC.seletedHashtag = self.seletedHashtag
    }
    
    
    @IBAction func addTag(_ sender: Any) {
        showAlertWithTextField1()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hashtagArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "hashtagCategoriesCell", for: indexPath) as! hashtagTableViewCell
        let dataOfUser1:userDetails1
        dataOfUser1 = hashtagArray[indexPath.row]
        cell1.newtagLabel.text = dataOfUser1.username1
        return cell1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.seletedHashtag = hashtagArray[indexPath.row].username1
        performSegue(withIdentifier: "GoToHashtags", sender: self)
    }
}
