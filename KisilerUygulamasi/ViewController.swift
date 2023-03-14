//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Bircan Sezgin on 13.03.2023.
//

import UIKit
import CoreData
//!!!!!
let appdelegete = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {
    
// Veri tabanina veri kayit islmenini gerceklestirmek uzere!
    let context = appdelegete.persistentContainer.viewContext

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kisilerTabelView: UITableView!
    
    var kisilerListe = [Kisiler]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        kisilerTabelView.delegate = self
        kisilerTabelView.dataSource = self
        searchBar.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tumKisilerAlGuncelle()
        
    // Veri Guncelleme
        kisilerTabelView.reloadData()
    }
    
// !!!!!!!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        if segue.identifier == "toDetay"{
            let gidilecekVC = segue.destination as! KisiDetailsViewController
            gidilecekVC.kisi = kisilerListe[indeks!]
        }
        
        if segue.identifier == "toGuncelle"{
            let gidilecekVC = segue.destination as! KisiEditViewController
            gidilecekVC.kisi = kisilerListe[indeks!]
        }
    }
    
// Calisma amacaci! Kisi eklenince DataB eklensin ve tableView'da gosterilmesini istiyoruz.
    func tumKisilerAlGuncelle(){
        do{
            kisilerListe = try context.fetch(Kisiler.fetchRequest())
        }catch{
            print(error)
        }
    }

}

// TABLEVIEW
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "kisiHucre", for: indexPath) as! KisiHucreTableViewCell
        cell.kisiIsimLabel.text = "\(kisi.kisi_ad!) - \(kisi.kisi_tel!)"
        return cell
    }
    
// Sutun Secilince !!
//DEtAY
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
// silme buttona basilinca
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { (UIContextualAction, view,  boolValue) in
// tableView'dan verileri silmek
            let silinecekKisi = self.kisilerListe[indexPath.row]
            self.context.delete(silinecekKisi)
            appdelegete.saveContext()
            
            self.tumKisilerAlGuncelle()
            self.kisilerTabelView.reloadData()
            print("Silme islemi Tamamlandi")
            
        }
        
        // Guncelleme buttonuna basilinca
        let guncelleAction = UIContextualAction(style: .normal, title: "Guncelle") { (UIContextualAction, view,  boolValue) in
            self.performSegue(withIdentifier: "toGuncelle", sender: indexPath.row)
            
            
            
        }
        
        return UISwipeActionsConfiguration(actions:  [silAction, guncelleAction])
    }

}

// searchBar
extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama Sonucu = \(searchText)")
    }
}

