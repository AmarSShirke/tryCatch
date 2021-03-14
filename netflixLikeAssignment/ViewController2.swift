//
//  ViewController2.swift
//  netflixLikeAssignment
//
//  Created by Amar Shirke on 13/03/21.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var counterLbl: UILabel!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (t) in
            print("Timer fire")
            self.count += 1
            self.counterLbl.text = "\(self.count)"
            if(self.count == 10){
                t.invalidate()
            }
        }
    }
}
