//
//  NewsCellTableViewCell.swift
//  Proyecto_Joseba_PNP
//
//  Created by Joseba Iturrioz Aguirre on 20/10/23.
//

import UIKit

class NewsCellTableViewCell: UITableViewCell {

    @IBOutlet weak var newTitleLabel: UILabel!
    @IBOutlet weak var newDescriptionLabel: UILabel!
    @IBOutlet weak var newImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
