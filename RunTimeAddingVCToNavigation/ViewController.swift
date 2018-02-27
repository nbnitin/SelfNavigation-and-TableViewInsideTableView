//
//  ViewController.swift
//  RunTimeAddingVCToNavigation
//
//  Created by Nitin Bhatia on 27/02/18.
//  Copyright © 2018 Nitin Bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tbView: UITableView!
    var data : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...9{
            data.append("\(i)")
        }

        tbView.delegate = self
        tbView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if ( indexPath.row == 0 ) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
            cell.lblTitle.text = data[indexPath.row]
            
            for i in 0...6{
                cell.data.append("child cell \(i)")
            }
            
            cell.cellTb.delegate = cell
            cell.cellTb.dataSource = cell
            cell.cellTb.reloadData()
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.lblTitle.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 140 + (44*5)
            
        }
        return 140
    }
    
}
