//
//  EmployeeViewController.swift
//  ExSegmentTableView
//
//  Created by RLogixxTraining on 14/09/23.
//

import UIKit

class EmployeeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var tblEmploy: UITableView!
    var arrEmployee = [["name": "Vishal" , "age" : "32", "branch": "CSE" , "year" : "2022" , "married":0 , "child" : 0 ],
    ["name": "Aman" , "age" : "24", "branch":"ME" , "year" : "2019" , "married":0 , "child" : 0 ],
    ["name": "Dhruv" , "age" : "21", "branch" :"IT" , "year" : "2024" , "married":0 , "child" : 0 ]]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblEmploy.delegate = self
        tblEmploy.dataSource = self
     //         print(arrEmployee)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrEmployee.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "storytable"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DataTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DataTableViewCell
        }
        cell?.btnMarried.addTarget(self, action: #selector(marryclick), for: .touchUpInside)
        cell?.btnChild.addTarget(self, action: #selector(childclick), for: .touchUpInside)
        
        
        cell?.lblName.text = arrEmployee[indexPath.row]["name"] as? String
        cell?.lblYear.text = arrEmployee[indexPath.row]["year"] as? String
        cell?.lblBranch.text = arrEmployee[indexPath.row]["branch"] as? String
        cell?.lblAge.text = arrEmployee[indexPath.row]["age"] as? String
        cell?.btnChild.tag = indexPath.row
        cell?.btnMarried.tag = indexPath.row
        
        
        return cell!
        
    }
    @objc func childclick(sender : UIButton) {
        
        print(sender.tag)
        arrEmployee[sender.tag]["child"] = 1
        print(arrEmployee)
//        arrEmployee[sender.tag]["child"] = "1"
//        printContent(arrEmployee)
    }
    @objc func marryclick(sender : UIButton) {
        
        print(sender.tag)
        arrEmployee[sender.tag]["married"] = 1
        print(arrEmployee)
        //        arrEmployee[sender.tag]["child"] = "1"
//        printContent(arrEmployee)
    }
   
    @IBAction func btnShow(_ sender: Any) {
        let mapViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "pushNavi") as? ViewController
        mapViewControllerObj?.arrStore = arrEmployee
        self.navigationController?.pushViewController(mapViewControllerObj!, animated: true)
        print("clicked")
        
        
    }
    
}
