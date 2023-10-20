//
//  ChosenNewViewController.swift
//  Proyecto_Joseba_PNP
//
//  Created by Joseba Iturrioz Aguirre on 20/10/23.
//

import UIKit

class ChosenNewViewController: UIViewController {

    @IBOutlet weak  var chosenImageView: UIImageView!
    @IBOutlet weak var chosenTitleLabel: UILabel!
    @IBOutlet weak var chosenDescriptionLabel: UILabel!
    
    var chosenTitle: String = ""
    var chosenDescription: String = ""
    var chosenImageUrl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chosenTitleLabel.text = chosenTitle
        chosenDescriptionLabel.text = chosenDescription
        let url = URL(string: chosenImageUrl)!
        if let imageData = try? Data(contentsOf: url) {
            chosenImageView?.image = UIImage(data: imageData)
        }
        
    }
    

}
