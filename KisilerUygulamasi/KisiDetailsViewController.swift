//
//  KisiDetailsViewController.swift
//  KisilerUygulamasi
//
//  Created by Bircan Sezgin on 13.03.2023.
//

import UIKit

class KisiDetailsViewController: UIViewController {

    @IBOutlet weak var kisiDetailsName: UILabel!
    @IBOutlet weak var kisiDetailsTel: UILabel!
    
    var kisi:Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi{
            kisiDetailsName.text = k.kisi_ad
            kisiDetailsTel.text = k.kisi_tel
        }
    }
    



}
