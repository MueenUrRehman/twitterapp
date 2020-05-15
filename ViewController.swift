//
//  ViewController.swift
//  InstagramApp
//
//  Created by mueen on 29/04/2020.
//  Copyright © 2020 mueen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    struct userDetails {
        var username:String
        var followers:String
        var imageUrl:String
    }
     
    
    @IBOutlet weak var tableView: UITableView!
    
    var userdata = [userDetails]()
    var noOfFollowers:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //firstMessagePopUp()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func usernameNotExists() {
        let alertController1 = UIAlertController(title: "This username does not exist. Try again!", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Ok", style: .default) { (_) in
        }
        
        alertController1.addAction(confirmAction)
        self.present(alertController1, animated: true, completion: nil)
    }
    
    
    func showAlertWithTextField()
    {
        let alertController = UIAlertController(title: "Add New Name", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Add", style: .default) { (_) in
            if let txtField = alertController.textFields?.first, let text = txtField.text {
                // operations
                
                let baseUrl = "https://www.twitter.com/\(text)"
                let url = URL(string: baseUrl)
                
               let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                    guard let data = data
                        else {
                          print("data was nil")
                        return
                    }
                    
                    DispatchQueue.main.async {
                        guard let htmlString = String(data: data, encoding: .utf8)
                            else {
                            print("couldn't cast data into String")
                            return
                        }
                        
                        print(htmlString)
                        // Total Followers
                        let leftSideStringForFollowers = """
                        &quot;followers_count&quot;:
                        """
                        let rightSideStringForFollowers = """
                        ,&quot;friends_count&quot;
                        """
                        
                        let leftSideStringForimages = """
                        ;profile_background_tile&quot;:false,&quot;profile_image_url&quot;:&quot;
                        """
                        let rightSideStringForimages = """
                        &quot;,&quot;profile_image_url_https&quot;:&quot;
                        """
                        
                        guard
                            let leftSideRangeFollowers = htmlString.range(of: leftSideStringForFollowers)
                            else {
                                self.usernameNotExists()
                                print("couldn't find left range of followers")
                                
                                return
                        }
                        guard
                            let rightSideRangeFollowers = htmlString.range(of: rightSideStringForFollowers)
                            else {
                                print("couldn't find right range of followers")
                                return
                        }
                        
                        guard
                            let leftSideRangeProfileImage = htmlString.range(of: leftSideStringForimages)
                            else {
                                self.usernameNotExists()
                                print("couldn't find left range of image")
                                
                                return
                        }
                        guard
                            let rightSideRangeProfileImage = htmlString.range(of: rightSideStringForimages)
                            else {
                                print("couldn't find right range of image")
                                return
                        }
                        
                        let rangeOfTheData = leftSideRangeFollowers.upperBound..<rightSideRangeFollowers.lowerBound
                        let valueWeWantToGrab = htmlString[rangeOfTheData]
                        print(valueWeWantToGrab)
                        let followers = String(valueWeWantToGrab)
                        
                        let rangeOfTheDataForImages = leftSideRangeProfileImage.upperBound..<rightSideRangeProfileImage.lowerBound
                        let valueWeWantToGrabForImages = htmlString[rangeOfTheDataForImages]
                        print(valueWeWantToGrabForImages)
                        
                        let images = String(valueWeWantToGrabForImages)
                        
                        let data = userDetails(username: text, followers: followers, imageUrl: images)
                        self.userdata.append(data)
                        
                        self.tableView.reloadData()
                    }
                }
                task.resume()
                
            }
       
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func addName(_ sender: Any)
    {
        showAlertWithTextField()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfo", for: indexPath) as! UserDetailsCell
        let dataOfUser:userDetails
        dataOfUser = userdata[indexPath.row]
        cell.nameLabel.text = dataOfUser.username
        cell.followersLabel.text = dataOfUser.followers
        let url2 = URL(string: "https://pbs.twimg.com/profile_images/1115234338185076740/bGgpNy-Q_normal.jpg")
        cell.personImage.load(url2: url2!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            userdata.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// uiimageview

extension UIImageView {
    func load(url2: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url2) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


