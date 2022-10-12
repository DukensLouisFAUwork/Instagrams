//
//  PostCell.swift
//  Instagram
//
//  Created by dwork on 10/11/22.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var captionlabel: UILabel!
    @IBOutlet weak var Usernamelabel: UILabel!
    @IBOutlet weak var photoview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
