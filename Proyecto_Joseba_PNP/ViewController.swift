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
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var acceptCustomButton: UIButton!
    
    //Variables
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        acceptButton.isHidden = true
        acceptButton.layer.cornerRadius = 12.0
        acceptCustomButton.layer.cornerRadius = 12.0
    }
    
    func createToolBar() -> UIToolbar {
        //Toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Boton "Hecho"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonPressed))
        toolBar.setItems([doneButton], animated: true)
        
        return toolBar
    }

    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = createToolBar()
    }
    
    @objc func doneButtonPressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.dateTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
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
        if segue.identifier == "PopUpIdentifier" {
            let popUpView = segue.destination as! PopUpViewController
            popUpView.nameUser = nameTextField.text ?? "Nombre"
            popUpView.surNameUser = surnameTextField.text ?? "Apellidos"
            popUpView.dateUser = dateTextField.text!
            }
        }
    
}

