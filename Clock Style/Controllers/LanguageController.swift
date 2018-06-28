//
//  LanguageController.swift
//  Clock Style
//
//  Created by Kevin Sawicke on 6/27/18.
//  Copyright © 2018 Kevin Sawicke. All rights reserved.
//

import UIKit

protocol ChangeLanguageDelegate {
    
    func userChangedLanguage(languageNumber: Int)
    
}

class LanguageController: UIViewController {

    var languageDelegate : ChangeLanguageDelegate?
    
    @IBAction func onSelectLanguage(_ sender: UIButton) {
        
        languageDelegate?.userChangedLanguage(languageNumber: sender.tag)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
