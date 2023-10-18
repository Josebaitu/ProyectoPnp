//
//  ViewController.swift
//  Proyecto_Joseba_PNP
//
//  Created by Joseba Iturrioz Aguirre on 17/10/23.
//

import UIKit
import PKHUD

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var payNoPainLabel: UILabel!
    
    //Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello World")
        HUD.flash(.success, delay: 3.0)
        //PKHUD.sharedHUD.show() //Mostrar
        //PKHUD.sharedHUD.hide() //Ocultar
    }


}

