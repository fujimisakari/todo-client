//
//  TodoListCell.swift
//  Todo
//
//  Created by fujimisakari on 1/3/16.
//  Copyright © 2016 fujimisakari. All rights reserved.
//

import UIKit

class TodoListCell: UITableViewCell {
    
    @IBOutlet weak var todoListName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
