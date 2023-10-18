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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!

    
    //Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func acceptButtonAction(_ sender: Any) {
        let nameUser = nameTextField.text
        let surnameUser = surnameTextField.text
        
        let welcomeController = UIAlertController(title: "Welcome", message: "Bienvenido \(nameUser ?? "Nombre") \(surnameUser ?? "Apellidos")", preferredStyle: .alert)
                welcomeController.addAction(UIAlertAction(title: "Aceptar", style: .default))
        self.present(welcomeController, animated: true, completion: nil)
        
    }
    
    @IBAction func acceptCustomButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "PopUpIdentifier", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nameUser = nameTextField.text
        let surnameUser = surnameTextField.text
        
        if segue.identifier == "PopUpIdentifier" {
            let popUpView = segue.destination as! PopUpViewController
            popUpView.nameUser = nameTextField.text ?? "Nombre"
            popUpView.surNameUser = surnameTextField.text ?? "Apellidos"
            }
        }
    
}

