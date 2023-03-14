//
//  KisiEditViewController.swift
//  KisilerUygulamasi
//
//  Created by Bircan Sezgin on 13.03.2023.
//

import UIKit

class KisiEditViewController: UIViewController {
    // Burda textField'larin isimlerini yanlis yazmisim!
   
    @IBOutlet weak var kisiUpdateTextFieldName: UITextField!
    @IBOutlet weak var kisiUptadeTextField: UITextField!
    
    var kisi:Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi{
            kisiUpdateTextFieldName.text = k.kisi_ad
            kisiUptadeTextField.text = k.kisi_tel
        }
        
    }
    
    @IBAction func updateButton(_ sender: Any) {
        
        
        
    }
    
}
