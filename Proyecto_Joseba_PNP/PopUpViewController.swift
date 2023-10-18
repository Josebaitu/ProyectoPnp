//
//  PopUpViewController.swift
//  Proyecto_Joseba_PNP
//
//  Created by Joseba Iturrioz Aguirre on 18/10/23.
//

import UIKit
import Foundation

class PopUpViewController: UIViewController {
    var nameUser: String = ""
    var surNameUser: String = ""
    //Outlets
    @IBOutlet weak var popUpCustomLabel: UILabel!
    @IBOutlet weak var acceptPopUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        acceptPopUpButton.layer.cornerRadius = 12.0
        popUpCustomLabel.text = "Bienvenido \(nameUser) \(surNameUser)"
    }

    @IBAction func returnButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
}
