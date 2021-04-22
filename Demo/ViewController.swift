//
//  ViewController.swift
//  Demo
//
//  Created by Macbook Air on 07/04/21.
//  Copyright © 2021 Dinesh. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var usersTableView: UITableView!
    var userList = [UserList]()
    
    // first commit in beta branch.
    //fixing bugs.
    //creating conflict.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "UsersTBCell", bundle: nil)
        usersTableView.register(nib, forCellReuseIdentifier: "UsersTBCell")
        
        usersTableView.tableFooterView = UIView()
        apiCall()
    }
    
    func apiCall() {
        let url = "https://demo1063411.mockable.io/getUserList"
        
        WebService.shared.apiGet(url: url, parameters: [:]) { (response, error) in
            
            switch error{
            case nil:
                do {
                    let getData = try JSONDecoder().decode(UserDataModel.self, from: response!)
                    
                    switch getData.status{
                    case true:
                        print("")
                        self.userList = getData.userList!
                        self.usersTableView.reloadData()
                        
                    default:
                        print(getData.statusMessage ?? "Something Went Wrong")
                    }
                } catch {
                    print(error.localizedDescription)
                }
            default:
                print(error?.localizedDescription ?? "Error")
                
            }
        }
    }


}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if userList.count != 0{
            return userList.count
        }else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTBCell", for: indexPath) as! UsersTBCell
        cell.hobbiesCollectionView.register(UINib(nibName: "HobbiesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HobbiesCollectionViewCell")
        cell.userNameLbl.text = userList[indexPath.row].firstName
        cell.userEmailLbl.text = userList[indexPath.row].emailId
        
        cell.userProfilePic.sd_setImage(with: URL(string: userList[indexPath.row].imageUrl ?? ""), completed: nil)
        cell.configure(Hobbies: userList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
