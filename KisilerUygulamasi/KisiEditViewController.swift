//
//  KisiEditViewController.swift
//  KisilerUygulamasi
//
//  Created by Bircan Sezgin on 13.03.2023.
//

import UIKit

class KisiEditViewController: UIViewController {
    let context = appdelegete.persistentContainer.viewContext
   
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
        
        if let k = kisi, let ad = kisiUpdateTextFieldName.text, let telNo = kisiUptadeTextField.text{
        

            
            k.kisi_ad = ad
            k.kisi_tel = telNo
            appdelegete.saveContext()
            guncellendiUyari(title: "", message: "Guncelleme Basarili")
            
            
        }
        
    }
    
    
    func guncellendiUyari(title:String, message:String){
        let alertEklendi = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Tamam", style: .default) { UIAlertAction in
            self.navigationController?.popViewController(animated: true)
        }
            alertEklendi.addAction(okButton)
            self.present(alertEklendi, animated: true)
    }
    
}
