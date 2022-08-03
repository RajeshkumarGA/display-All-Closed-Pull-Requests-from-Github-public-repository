//
//  RequestsTableViewCell.swift
//  Github public All Closed Pull Requests
//
//  Created by Admin on 02/08/22.
//

import UIKit

class RequestsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var createdDate: UILabel!
    @IBOutlet weak var closedDate: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dataView.layer.cornerRadius = 12
        dataView.layer.masksToBounds = true;

        dataView.backgroundColor = UIColor.white
        dataView.layer.shadowColor = UIColor.lightGray.cgColor
        dataView.layer.shadowOpacity = 0.8
        dataView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        dataView.layer.shadowRadius = 6.0
        dataView.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
