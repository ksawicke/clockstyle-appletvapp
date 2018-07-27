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
    
    @IBOutlet weak var themePreviewImage: UIImageView!
    @IBOutlet weak var themePreviewDescription: UITextView!
    
    @IBOutlet weak var buttonThemepack1: UIButton!
    @IBOutlet weak var buttonThemepack2: UIButton!
    @IBOutlet weak var buttonThemepack3: UIButton!
    @IBOutlet weak var buttonThemepack4: UIButton!
    @IBOutlet weak var buttonThemepack5: UIButton!
    @IBOutlet weak var buttonThemepack6: UIButton!
    @IBOutlet weak var buttonThemepack7: UIButton!
    @IBOutlet weak var buttonThemepack8: UIButton!
    @IBOutlet weak var buttonThemepack9: UIButton!
    @IBOutlet weak var buttonRestorePurchases: UIButton!
    
    @IBOutlet weak var labelThemepack1: UILabel!
    @IBOutlet weak var labelThemepack2: UILabel!
    @IBOutlet weak var labelThemepack3: UILabel!
    @IBOutlet weak var labelThemepack4: UILabel!
    @IBOutlet weak var labelThemepack5: UILabel!
    @IBOutlet weak var labelThemepack6: UILabel!
    @IBOutlet weak var labelThemepack7: UILabel!
    @IBOutlet weak var labelThemepack8: UILabel!
    @IBOutlet weak var labelThemepack9: UILabel!
    
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
          "clockstyle.themepack6",
          "clockstyle.themepack7",
          "clockstyle.themepack8",
          "clockstyle.themepack9" ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let inAppPurchaseButtons = [
            [ buttonThemepack1,
              buttonThemepack2,
              buttonThemepack3,
              buttonThemepack4,
              buttonThemepack5,
              buttonThemepack6,
              buttonThemepack7,
              buttonThemepack8,
              buttonThemepack9 ]
        ]
        
        let inAppPurchaseLabels = [
            [ labelThemepack1,
              labelThemepack2,
              labelThemepack3,
              labelThemepack4,
              labelThemepack5,
              labelThemepack6,
              labelThemepack7,
              labelThemepack8,
              labelThemepack9 ]
        ]
        
        var inAppPurchaseDescriptions = [String]()

        for i in 0...inAppPurchaseIds.count - 1 {
            for j in 0...inAppPurchaseIds[i].count - 1 {
                SwiftyStoreKit.retrieveProductsInfo([inAppPurchaseIds[i][j]]) { result in
                    if let product = result.retrievedProducts.first {
                        debugPrint(product)

                        let priceString = product.localizedPrice!
                        print("Product: \(product.localizedDescription), price: \(priceString)")

                        inAppPurchaseButtons[i][j]?.setTitle("\(priceString)", for: .normal)
                        
                        inAppPurchaseLabels[i][j]?.text = "\(product.localizedTitle)"
                        
                        self.themePreviewImage.image = UIImage(named: "theme-background-18")
                        
                        inAppPurchaseDescriptions.append("\(product.localizedDescription)")
                        
                        if j == 0 {
                            self.themePreviewDescription.text = "\(product.localizedDescription)"
                        }
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
        
        debugPrint(inAppPurchaseDescriptions)
//        themePreviewDescription.text = inAppPurchaseDescriptions[0]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func verifyPurchase(with id: String, sharedSecret: String) {
        let appleValidator = AppleReceiptValidator(service: .production, sharedSecret: sharedSecret)
        SwiftyStoreKit.verifyReceipt(using: appleValidator) { result in
            switch result {
            case .success(let receipt):
                let productId = id
                // Verify the purchase of Consumable or NonConsumable
                let purchaseResult = SwiftyStoreKit.verifyPurchase(
                    productId: productId,
                    inReceipt: receipt)
                
                switch purchaseResult {
                case .purchased(let receiptItem):
                    print("\(productId) is purchased: \(receiptItem)")
                case .notPurchased:
                    print("The user has never purchased \(productId)")
                }
            case .error(let error):
                print("Receipt verification failed: \(error)")
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
