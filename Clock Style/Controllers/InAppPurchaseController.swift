//
//  InAppPurchaseController.swift
//  Clock Style
//
//  Created by Kevin Sawicke on 7/9/18.
//  Copyright © 2018 Kevin Sawicke. All rights reserved.
//

import UIKit
import SwiftyStoreKit

class InAppPurchaseController: UIViewController {

    @IBOutlet weak var buttonThemepack1: UIButton!
    @IBOutlet weak var buttonThemepack2: UIButton!
    @IBOutlet weak var buttonThemepack3: UIButton!
    @IBOutlet weak var buttonThemePack4: UIButton!
    @IBOutlet weak var buttonThemePack5: UIButton!
    @IBOutlet weak var buttonThemePack6: UIButton!
    @IBOutlet weak var buttonRestorePurchases: UIButton!
    
    @IBAction func onClickButtonThemepack1(_ sender: Any) {
    }
    @IBAction func onClickButtonThemepack2(_ sender: Any) {
    }
    @IBAction func onClickButtonThemepack3(_ sender: Any) {
    }
    @IBAction func onClickButtonThemepack4(_ sender: Any) {
    }
    @IBAction func onClickButtonThemepack5(_ sender: Any) {
    }
    @IBAction func onClickButonThemepack6(_ sender: Any) {
    }
    @IBAction func onClickButtonRestorePurchases(_ sender: Any) {
    }
    
    var inAppPurchaseIds = [
        ["clockstyle.themepack1",
         "clockstyle.themepack2",
         "clockstyle.themepack3",
         "clockstyle.themepack4",
         "clockstyle.themepack5",
         "clockstyle.themepack6"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        retrieveProductsInfo()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func retrieveProductsInfo() {
        
        for i in 0...inAppPurchaseIds.count - 1 {
            for j in 0...inAppPurchaseIds[i].count - 1 {
                SwiftyStoreKit.retrieveProductsInfo([inAppPurchaseIds[i][j]]) { result in
                    if let product = result.retrievedProducts.first {
                        let priceString = product.localizedPrice!
                        print("Product: \(product.localizedDescription), price: \(priceString)")
                    }
                    else if let invalidProductId = result.invalidProductIDs.first {
                        print("Invalid product identifier: \(invalidProductId)")
                    }
                    else {
                        print("Error: \(result.error)")
                    }
                }
            }
        }
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
