//
//  SettingsController.swift
//  Clock Style
//
//  Created by Kevin Sawicke on 6/8/18.
//  Copyright © 2018 Kevin Sawicke. All rights reserved.
//

import UIKit

protocol ChangeSettingsDelegate {
    
    func userChangedSettings (bgColor : String)
    
}

class SettingsController_OLD: UIViewController {
    
    var delegate : ChangeSettingsDelegate?
    
    var bgColor = ""
    
    
    //    @IBAction func onClickSave(_ sender: UIButton) {
    //        print("YO")
    //    }
    //
    //    @IBAction func onClickSaveSettings(_ sender: Any) {
    //        delegate?.userChangedSettings(bgColor: "SLFKJSDFKLSDJFLKSDFJ")
    //
    //        print("TEST@")
    //
    //        self.dismiss(animated: true, completion: nil)
    //    }
    //    @IBAction func onClickSaveSettings(_ sender: Any) {
    //        self.delegate?.userChangedSettings(unitNumber: "KEVIN")
    //
    //        self.dismiss(animated: true, completion: nil)
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSaveButton(_ sender: UIButton) {
        delegate?.userChangedSettings(bgColor: "SANDALWOOD")
        
        dismiss(animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
    //        let destinationVC = segue.destination as! ClockController
    //
    ////        switch(segue.identifier) {
    ////            case "goToScanBarcode":
    ////                let destinationVC = segue.destination as! ClockController
    ////
    ////            default:
    ////                print("ERROR")
    ////        }
    //
    //    }
    
}
