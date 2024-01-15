//
//  DataTableViewCell.swift
//  ExSegmentTableView
//
//  Created by RLogixxTraining on 14/09/23.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var btnMarried: UIButton!
    @IBOutlet weak var btnChild: UIButton!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblBranch: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
