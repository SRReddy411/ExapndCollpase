//
//  PermissionTableViewCell.swift
//  Demo
//
//  Created by RamiReddy on 15/11/22.
//

import UIKit

class PermissionTableViewCell: UITableViewCell {
    static let cellIdentifer = "PermissionTableViewCell"
    static let nibFile = UINib(nibName: cellIdentifer, bundle: nil)
    
    @IBOutlet weak var permissionLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
