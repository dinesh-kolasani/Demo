//
//  UsersTBCell.swift
//  Demo
//
//  Created by Macbook Air on 07/04/21.
//  Copyright © 2021 Dinesh. All rights reserved.
//

import UIKit

class UsersTBCell: UITableViewCell {
    
    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userEmailLbl: UILabel!
    
    @IBOutlet weak var hobbiesCollectionView: UICollectionView!{
        didSet{
            hobbiesCollectionView.delegate = self
            hobbiesCollectionView.dataSource = self
        }
    }
    var hobbies = ["demo","hobbies, hobbies","raj","cricket","demo","hobbies","raj","cricket"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(Hobbies: UserList){
        //self.hobbies = Hobbies.hobbies!
        hobbiesCollectionView.reloadData()
    }
    
}
extension UsersTBCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hobbies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "HobbiesCollectionViewCell", for: indexPath) as! HobbiesCollectionViewCell
        cell.hobbiesLbl.text = self.hobbies[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let text = self.hobbies[indexPath.row]
        let cellWidth = text.size(withAttributes:[.font: UIFont.systemFont(ofSize:12.0)]).width + 30.0
        return CGSize(width: cellWidth, height: collectionView.bounds.height)
    }
}
