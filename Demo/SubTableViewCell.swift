//
//  SubTableViewCell.swift
//  Demo
//
//  Created by RamiReddy on 15/11/22.
//

import UIKit

class SubTableViewCell: UITableViewCell {
    static let cellIdentifer = "SubTableViewCell"
    static let nibFile = UINib(nibName: cellIdentifer, bundle: nil)
    
    
    @IBOutlet weak var permissionTableHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var dropDownArrowBtn: UIButton!
    @IBOutlet weak var configureNameLbl: UILabel!
    @IBOutlet weak var permissionTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        subView.layer.cornerRadius = 10.0
        subView.layer.borderColor = UIColor.lightGray.cgColor
        subView.layer.borderWidth = 0.5
        permissionTableView.delegate = self
        permissionTableView.dataSource = self
        //permissionTableView.layoutIfNeeded()
        permissionTableView.register(PermissionTableViewCell.nibFile, forCellReuseIdentifier: PermissionTableViewCell.cellIdentifer)
    }
    
    func setCondigure(data:DataModel){
        if data.isExpand {
            permissionTableView.isHidden = true
            permissionTableHeightConstrain.constant = 0
            self.permissionTableView.reloadData()
            
        } else {
            permissionTableView.isHidden = false
            permissionTableHeightConstrain.constant = 5 * 50
            self.permissionTableView.reloadData()
            
            
            
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}



extension SubTableViewCell:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension SubTableViewCell:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.permissionTableView.dequeueReusableCell(withIdentifier: PermissionTableViewCell.cellIdentifer) as! PermissionTableViewCell? else {
            return UITableViewCell()
        }
        cell.permissionLbl.text = "row \(indexPath.row)"
        return cell
    }
}
