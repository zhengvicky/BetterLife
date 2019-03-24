//
//  Activities.swift
//  BetterLife
//
//  Created by Vicky Zheng on 3/24/19.
//  Copyright © 2019 Vicky Zheng. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {
    
    @IBAction func tappedEatingHealthy(_ sender: UIButton) {
        print("Tapped eating healthy!")
        

        let vc = FormViewController.create(type: .eating)
        self.navigationController?.pushViewController(vc, animated:true)
    }
    
    @IBAction func tappedTravel(_ sender: UIButton) {
        print("Tapped Travel")
        
        let vc = FormViewController.create(type: .travel)
        self.navigationController?.pushViewController(vc, animated:true)
    }
    
    @IBAction func tappedagriculture(_ sender: UIButton) {
        print("Tapped Agriculture")
        
        let vc = FormViewController.create(type: .agriculture)
        self.navigationController?.pushViewController(vc, animated:true)
    }
    
    @IBAction func Tappedcleanup(_ sender: Any) {
        print("Tapped Cleanup")
        
        let vc = FormViewController.create(type: .cleanup)
        self.navigationController?.pushViewController(vc, animated:true)
    }
    
}
