//
//  LichCaNhanTableViewCell.swift
//  LichVanNien
//
//  Created by TBM on 6/29/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class LichCaNhanTableViewCell: UITableViewCell {
    @IBOutlet weak var labeltieude: UILabel!
    @IBOutlet weak var labelgiothu: UILabel!
    @IBOutlet weak var labelal: UILabel!
    @IBOutlet weak var labeldl: UILabel!
    @IBOutlet weak var labellap: UILabel!
    @IBOutlet weak var labelluc: UILabel!
    @IBOutlet weak var labeldiadiem: UILabel!
    @IBOutlet weak var labelghichu: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
