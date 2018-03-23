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
    var totalInnerItems = 4
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.lblTitle.text = data[indexPath.row]
        
        if ( indexPath.row == 0 ) {
            
            cell.data.removeAll()
            for i in 0...totalInnerItems{
                cell.data.append("child cell \(i)")
            }
            
            cell.cellTb.delegate = cell
            cell.cellTb.dataSource = cell
            cell.cellTb.reloadData()
            return cell
        } else {
            cell.data = []
            cell.cellTb.delegate = nil
            cell.cellTb.dataSource = nil
        }
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            
            if ( totalInnerItems < 6 ) {
                //140 is height of each outer + 44 is height of each cell in inner table view
                return CGFloat(140 + (44*totalInnerItems))
            }
             return CGFloat(140 + (44*5))
            
        }
        return 140
    }
    
    @IBAction func btnChangeCount(_ sender: Any) {
        let ac = UIAlertController(title: "Enter New Count", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.textFields![0].text = "\(totalInnerItems)"
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            self.totalInnerItems = Int(ac.textFields![0].text!)!
            let indexPath : IndexPath = IndexPath(row: 0, section: 0)
            self.tbView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        ac.addAction(submitAction)
        
        present(ac, animated: true)
    }
}
