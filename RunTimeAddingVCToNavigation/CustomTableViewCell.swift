//
//  CustomTableViewCell.swift
//  RunTimeAddingVCToNavigation
//
//  Created by Nitin Bhatia on 27/02/18.
//  Copyright © 2018 Nitin Bhatia. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var cellTb: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    var data : [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InnerTableViewCell
        cell.textLabel?.text = data[indexPath.row]
        print(data[indexPath.row])
        return cell
    }
}
