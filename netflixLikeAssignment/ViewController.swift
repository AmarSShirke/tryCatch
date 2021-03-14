//
//  ViewController.swift
//  netflixLikeAssignment
//
//  Created by Amar Shirke on 13/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblMain: UITableView!
    
    let HeaderArr = ["HD","Standard","Series"]
    let dataArr = [["HD1","HD2","HD3","HD4","HD5","HD6","HD7","HD8","HD9","HD10","HD11","HD12"],
                   ["K3G","Phantom","Spiderman","DDLJ","MS"],
                   ["S1","S22","S433","S6789"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("New commit")
        
    }

}

extension ViewController :UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return HeaderArr[section]
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTVC") as! CustomTVC
        cell.collectionView.tag = indexPath.section
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        
        return cell
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCVC", for:indexPath) as! CustomCVC
        cell.backgroundColor = UIColor.red
        cell.lbl.text = dataArr[collectionView.tag][indexPath.row]
        return cell
        
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: collectionView.frame.size.height)
    }
}


