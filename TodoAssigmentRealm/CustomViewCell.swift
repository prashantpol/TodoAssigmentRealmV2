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
    
    @IBOutlet weak var switchTodo: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func todoSwitch(_ sender: UISwitch) {
        
        if(sender.isOn)
        {
            lblname.textColor=UIColor.black;
            lblname.font=UIFont.systemFont(ofSize: 18, weight: 0)
        }
        else
        {
            lblname.textColor=UIColor.lightGray;
            lblname.font=UIFont.italicSystemFont(ofSize: 20)
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
