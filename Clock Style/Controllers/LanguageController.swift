//
//  LanguageController.swift
//  Clock Style
//
//  Created by Kevin Sawicke on 6/27/18.
//  Copyright © 2018 Kevin Sawicke. All rights reserved.
//

import UIKit

protocol ChangeLanguageDelegate {
    
    func userChangedLanguage (languageNumber: Int)
    
}

class LanguageController: UIViewController {

    var languageDelegate : ChangeLanguageDelegate?
    
    @IBAction func onClickLanguage(_ sender: Any) {
        print("You clicked language with tag: \((sender as AnyObject).tag)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("LanguageVC viewDidLoad")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
