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
    @IBOutlet weak var buttonThemepack4: UIButton!
    @IBOutlet weak var buttonThemepack5: UIButton!
    @IBOutlet weak var buttonThemepack6: UIButton!
    @IBOutlet weak var buttonRestorePurchases: UIButton!
    
    @IBOutlet weak var labelThemepack1: UILabel!
    @IBOutlet weak var labelThemepack2: UILabel!
    @IBOutlet weak var labelThemepack3: UILabel!
    @IBOutlet weak var labelThemepack4: UILabel!
    @IBOutlet weak var labelThemepack5: UILabel!
    @IBOutlet weak var labelThemepack6: UILabel!
    @IBOutlet weak var labelRestorePurchases: UILabel!
    
    
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
    @IBAction func onClickButtonThemepack6(_ sender: Any) {
    }
    @IBAction func onClickButtonRestorePurchases(_ sender: Any) {
    }
    
    let inAppPurchaseIds = [
        [ "clockstyle.themepack1",
          "clockstyle.themepack2",
          "clockstyle.themepack3",
          "clockstyle.themepack4",
          "clockstyle.themepack5",
          "clockstyle.themepack6" ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let inAppPurchaseButtons = [
            [ buttonThemepack1,
              buttonThemepack2,
              buttonThemepack3,
              buttonThemepack4,
              buttonThemepack5,
              buttonThemepack6 ]
        ]
        
        let inAppPurchaseLabels = [
            [ labelThemepack1,
              labelThemepack2,
              labelThemepack3,
              labelThemepack4,
              labelThemepack5,
              labelThemepack6 ]
        ]

        for i in 0...inAppPurchaseIds.count - 1 {
            for j in 0...inAppPurchaseIds[i].count - 1 {
                SwiftyStoreKit.retrieveProductsInfo([inAppPurchaseIds[i][j]]) { result in
                    if let product = result.retrievedProducts.first {
                        let priceString = product.localizedPrice!
                        print("Product: \(product.localizedDescription), price: \(priceString)")
                        
//                        let buttonLabel = "\(product.localizedDescription), price: \(priceString)"
//                        print(inAppPurchaseButtons)
                        inAppPurchaseButtons[i][j]?.setTitle("\(priceString)", for: .normal)
                        
                        inAppPurchaseLabels[i][j]?.text = "\(product.localizedDescription)"
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
