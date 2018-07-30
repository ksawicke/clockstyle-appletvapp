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
    
    var selectedTheme : Int = 0
    
    @IBOutlet weak var themePreviewImage: UIImageView!
    
    @IBOutlet weak var themePreviewLabel: UILabel!
    @IBOutlet weak var themePreviewDescription: UITextView!
    @IBOutlet weak var buyButtonLabel: UIButton!
    @IBOutlet weak var prevButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    @IBOutlet weak var restorePurchasesLabel: UIButton!
    
    @IBAction func onClickBuyButton(_ sender: Any) {
        
    }
    
    @IBAction func buttonClickPrev(_ sender: Any) {
        if selectedTheme == inAppPurchaseLabels.count - 1 {
            selectedTheme = 0
        } else {
            selectedTheme = selectedTheme - 1
        }
        
        updateTheme()
    }
    
    @IBAction func buttonClickNext(_ sender: Any) {
        if selectedTheme == inAppPurchaseLabels.count - 1 {
            selectedTheme = 0
        } else {
            selectedTheme = selectedTheme + 1
        }
        
        updateTheme()
    }
    
    @IBOutlet weak var restorePurchasesButtonLabel: UIButton!
    
    @IBAction func onClickRestorePurchasesButton(_ sender: Any) {
        
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
    
    var inAppPurchaseLabels = [String]()
    var inAppPurchaseDescriptions = [String]()
    var inAppPurchasePrices = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0...inAppPurchaseIds.count - 1 {
            for j in 0...inAppPurchaseIds[i].count - 1 {
                SwiftyStoreKit.retrieveProductsInfo([inAppPurchaseIds[i][j]]) { result in
                    if let product = result.retrievedProducts.first {
                        debugPrint(product)

                        var productPrice = product.localizedPrice!
                        var productLabel = "\(product.localizedTitle)"
                        var productDescription = "\(product.localizedDescription)"
                        
                        self.inAppPurchaseLabels.append(productLabel)
                        self.inAppPurchaseDescriptions.append(productDescription)
                        self.inAppPurchasePrices.append(productPrice)
                        
//                        print("Product: \(product.localizedDescription), price: \(priceString)")
//
//                        inAppPurchaseButtons[i][j]?.setTitle("\(priceString)", for: .normal)
//
//                        inAppPurchaseLabels[i][j]?.text = "\(product.localizedTitle)"
//
//                        self.themePreviewImage.image = UIImage(named: "theme-background-18")
//
//                        inAppPurchaseDescriptions.append("\(product.localizedDescription)")
                        
                        if j == 0 {
                            self.themePreviewLabel.text = self.inAppPurchaseLabels[0]
                            self.themePreviewDescription.text = self.inAppPurchaseDescriptions[0]
                            self.buyButtonLabel.setTitle(self.inAppPurchasePrices[0], for: .normal)
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
        
        debugPrint(inAppPurchaseLabels)
        debugPrint(inAppPurchaseDescriptions)
        debugPrint(inAppPurchasePrices)
        
//        themePreviewDescription.text = inAppPurchaseDescriptions[0]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredFocusedView: UIView? {
        get {
            return self.nextButtonLabel
        }
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
    
    func updateTheme() {
        self.themePreviewLabel.text = self.inAppPurchaseLabels[selectedTheme]
        self.themePreviewDescription.text = self.inAppPurchaseDescriptions[selectedTheme]
        self.buyButtonLabel.setTitle(self.inAppPurchasePrices[selectedTheme], for: .normal)
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
