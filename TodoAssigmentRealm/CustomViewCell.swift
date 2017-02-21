//
//  CustomViewCell.swift
//  TodoAssigmentRealm
// id : 300906092

//  Created by Prashant Pol on 2017-02-21.
//  Copyright © 2017 Polorg. All rights reserved.
//

import UIKit

class CustomViewCell: UITableViewCell {

    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var swtichTodo: UISwitch!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
