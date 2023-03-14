//
//  KisiEkleViewController.swift
//  KisilerUygulamasi
//
//  Created by Bircan Sezgin on 13.03.2023.
//

import UIKit

class KisiEkleViewController: UIViewController {
    
    // Veri tabanina veri kayit islmenini gerceklestirmek uzere!
        let context = appdelegete.persistentContainer.viewContext
    
    @IBOutlet weak var kisiNameTextField: UITextField!
    @IBOutlet weak var telefonNoTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func ekleButton(_ sender: Any) {
        
        if let ad = kisiNameTextField.text, let telefonNo = telefonNoTextField.text{
            // Bu nesne ile veri tabanina erismis oluyoruz.
            let kisi = Kisiler(context: context)
                    
            kisi.kisi_ad = ad
            kisi.kisi_tel = telefonNo
                    
            // Kaydetme islemi!
            appdelegete.saveContext()
           eklendiUyari(title: "", message: "Ekleme Islemi Tamamlandi")
        }
        

    }
    
    func eklendiUyari(title:String, message:String){
        let alertEklendi = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Tamam", style: .cancel) { UIAlertAction in
            self.navigationController?.popViewController(animated: true)
        }
            alertEklendi.addAction(okButton)
            self.present(alertEklendi, animated: true)
    }
}

