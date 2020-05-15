//
//  hashtagViewController.swift
//  InstagramApp
//
//  Created by mueen on 04/05/2020.
//  Copyright © 2020 mueen. All rights reserved.
//

import UIKit

class hashtagViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
     
    
    @IBOutlet weak var usertags: UITableView!
    
    var seletedHashtag: String!
    var copyIt = [String]()
    
    struct userDetails1 {
        var username1:String
        
    }
    
   
    
    var hashtagArray = [userDetails1]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //firstMessagePopUp1()
        usertags.dataSource = self
        usertags.delegate = self
        
        print("we successfully transferred the category name from previous table \(seletedHashtag!)")

        
    }
    
    func showAlertWithTextField1() {
        let alertController = UIAlertController(title: "Add new Hashtag", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Add", style: .default) { (_) in
            if let txtField = alertController.textFields?.first, let text = txtField.text {
                // operations
                print("Text==>" + text)
                
                let data1 = userDetails1(username1: text)
                self.hashtagArray.append(data1)
                self.usertags.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addTextField { (textField) in
            textField.placeholder = "Tag"
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func addTag(_ sender: Any) {
        showAlertWithTextField1()
    }
    
    @IBAction func copyAllHashtags(_ sender: Any) {
    // gora us ba methos kaar kae
        let alltags = copyIt.joined(separator: ", ")
        print(alltags)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hashtagArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "hashtagCell", for: indexPath) as! hashtagTableViewCell
        let dataOfUser1:userDetails1
        dataOfUser1 = hashtagArray[indexPath.row]
        cell1.newtagLabel.text = dataOfUser1.username1
        self.copyIt.append(dataOfUser1.username1)
        return cell1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            hashtagArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
