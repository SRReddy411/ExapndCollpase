//
//  HeaderTableViewCell.swift
//  Demo
//
//  Created by RamiReddy on 15/11/22.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    static let cellIdentifier = "HeaderTableViewCell"
    static let nibFile = UINib(nibName: cellIdentifier, bundle: nil)
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        headerView.layer.cornerRadius = 10.0
        headerView.layer.borderColor = UIColor.lightGray.cgColor
        headerView.layer.borderWidth = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
