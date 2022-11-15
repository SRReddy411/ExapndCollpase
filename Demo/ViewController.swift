//
//  ViewController.swift
//  Demo
//
//  Created by RamiReddy on 15/11/22.
//

import UIKit


struct DataModel{
    var name:String
    var isExpand:Bool
}
class ViewController: UIViewController {
    
    @IBOutlet weak var sampleTableView: UITableView!
    
    var dataModelArray = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        dataModelArray.append(DataModel(name: "Rami", isExpand: false))
        dataModelArray.append(DataModel(name: "reddy", isExpand: false))
        
        dataModelArray.append(DataModel(name: "seetharam", isExpand: false))
        
        dataModelArray.append(DataModel(name: "ram", isExpand: false))
        self.sampleTableView.reloadData()
        
    }
    
    fileprivate func setUpTableView(){
        sampleTableView.register(HeaderTableViewCell.nibFile, forCellReuseIdentifier: HeaderTableViewCell.cellIdentifier)
        sampleTableView.register(SubTableViewCell.nibFile, forCellReuseIdentifier: SubTableViewCell.cellIdentifer)
        
    }
    
    
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.cellIdentifier) as! HeaderTableViewCell
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    
}


extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModelArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.sampleTableView.dequeueReusableCell(withIdentifier: SubTableViewCell.cellIdentifer, for: indexPath) as! SubTableViewCell
        cell.configureNameLbl.text = dataModelArray[indexPath.row].name
        cell.dropDownArrowBtn.tag = indexPath.row
        cell.dropDownArrowBtn.addTarget(self, action: #selector(setUpExpand), for: UIControl.Event.touchUpInside)
        cell.setCondigure(data: dataModelArray[indexPath.row])
        if dataModelArray[indexPath.row].isExpand {
            
            print("expand bool value ***",dataModelArray[indexPath.row].isExpand)
        } else {
            print(" else expand bool value ***",dataModelArray[indexPath.row].isExpand)
            
        }
        cell.permissionTableView.reloadData()
        return cell
    }
    
    @objc func setUpExpand(sender:UIButton){
        
        if dataModelArray[sender.tag].isExpand{
            dataModelArray[sender.tag].isExpand = false
        } else {
            dataModelArray[sender.tag].isExpand = true
            
        }
        
        self.sampleTableView.reloadData()
    }
}
