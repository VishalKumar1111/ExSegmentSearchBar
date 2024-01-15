//
//  ViewController.swift
//  ExSegmentTableView
//
//  Created by RLogixxTraining on 14/09/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var arrStore = [[String:Any]]()
    var arrData = [[String:Any]]()
    var filteredData = [[String:Any]]()
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    searchBar.delegate = self
        
        
        var arrChild = [[String:Any]]()
        //seachBar.isHidden = true
        for x in arrStore {
            let status = String(describing: x["child"] ?? "")
            if status == "1" {
                arrChild.append(x)
            }
        }
        //print(arrChild)
        arrData = arrChild
        print(arrData)
 
        
    }
    @IBAction func btnSegment(_ sender: Any) {
        if segment.selectedSegmentIndex == 0{
            var arrChild = [[String:Any]]()
           // seachBar.isHidden = true
            
            for x in arrStore {
                let status = String(describing: x["child"] ?? "")
                if status == "1" {
                    arrChild.append(x)
                }
            }
            print(arrChild)
            arrData = arrChild
            tblView.reloadData()
        }
        if segment.selectedSegmentIndex == 1{
            var arrMarried = [[String:Any]]()
            // seachBar.isHidden = true
            for x in arrStore {
                let status = String(describing: x["married"] ?? "")
                if status == "1" {
                    arrMarried.append(x)
                }
            }
            print(arrMarried)
            arrData = arrMarried
            tblView.reloadData()
        }
        if segment.selectedSegmentIndex == 2{
            arrData  = arrStore
            //searchBar.showsScopeBar = true
            tblView.reloadData()
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "storytable"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DataTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DataTableViewCell
        }
        cell?.lblAge.text = arrData[indexPath.row]["age"] as? String
        cell?.lblName.text = arrData[indexPath.row]["name"] as? String
        cell?.lblYear.text = arrData[indexPath.row]["year"] as? String
        cell?.lblBranch.text = arrData[indexPath.row]["branch"] as? String
        cell?.btnChild.isHidden  = true
        cell?.btnMarried.isHidden = true
       
        return cell!
    }
    
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            if searchText.isEmpty {
             filteredData = arrStore
            } else {
                let keys = ["name", "age"]
                let subPredicates = keys.map({ NSPredicate(format: "%K CONTAINS[c] %@", $0, searchText) })
                let predicate = NSCompoundPredicate(orPredicateWithSubpredicates: subPredicates)
                filteredData = (arrStore.filter { predicate.evaluate(with: $0) } as NSArray) as! [[String : Any]]
            }
            arrData = filteredData
            
                     self.tblView.reloadData()
            
         }
        
      
    
}

