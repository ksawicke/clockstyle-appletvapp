//
//  InAppPurchaseController.swift
//  Clock Style
//
//  Created by Kevin Sawicke on 7/9/18.
//  Copyright © 2018 Kevin Sawicke. All rights reserved.
//

import UIKit
import SwiftyStoreKit
import JGProgressHUD

class InAppPurchaseController: UIViewController {
    
    var selectedTheme : Int = 0
    let sharedSecret = "ed62de2cc93d45558fd5b7aa5e028fac"
    
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
    var inAppPurchaseValidations = [String]()
    
    @IBOutlet weak var themePreviewImage: UIImageView!
    @IBOutlet weak var themePreviewLabel: UILabel!
    @IBOutlet weak var themePreviewDescription: UITextView!
    @IBOutlet weak var buyButtonLabel: UIButton!
    @IBOutlet weak var prevButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    @IBOutlet weak var restorePurchasesLabel: UIButton!
    @IBOutlet weak var restorePurchasesButtonLabel: UIButton!
    
    @IBAction func onClickBuyButton(_ sender: Any) {
        print(selectedTheme)
        let productIdentifierChosen = inAppPurchaseIds[0][selectedTheme]
        let productLabelChosen = inAppPurchaseLabels[selectedTheme]
        print(productIdentifierChosen)
        print(productLabelChosen)
        SwiftyStoreKit.purchaseProduct("\(productIdentifierChosen)", quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                self.inAppPurchaseValidations[self.selectedTheme] = "1"
                print(self.inAppPurchaseValidations[self.selectedTheme])
                self.showHUDMessage(messageType: "success", withMessage: "Enjoy this theme!")
//                print("Purchase Success: \(purchase.productId)")
                break
                
            case .error(let error):
                switch error.code {
                    case .unknown:
                        self.showHUDMessage(messageType: "error", withMessage: "Purchase failed. Try again.")
//                        print("Unknown error. Please contact support")
                        break
                    
                    case .clientInvalid:
                        self.showHUDMessage(messageType: "error", withMessage: "Purchase failed. Try again.")
//                        print("Not allowed to make the payment")
                        break
                    
                    case .paymentCancelled:
                        break
                    
                    case .paymentInvalid:
                        self.showHUDMessage(messageType: "error", withMessage: "Purchase failed. Try again.")
//                        print("The purchase identifier was invalid")
                        break
                    
                    case .paymentNotAllowed:
                        self.showHUDMessage(messageType: "error", withMessage: "Purchase failed. Try again.")
//                        print("The device is not allowed to make the payment")
                        break
                    
                    case .storeProductNotAvailable:
                        self.showHUDMessage(messageType: "error", withMessage: "Purchase failed. Try again.")
//                        print("The product is not available in the current storefront")
                        break
                    
                    case .cloudServicePermissionDenied:
                        self.showHUDMessage(messageType: "error", withMessage: "Purchase failed. Try again.")
//                        print("Access to cloud service information is not allowed")
                        break
                    
                    case .cloudServiceNetworkConnectionFailed:
                        self.showHUDMessage(messageType: "error", withMessage: "Purchase failed. Try again.")
//                        print("Could not connect to the network")
                        break
                    
                    case .cloudServiceRevoked:
                        self.showHUDMessage(messageType: "error", withMessage: "Purchase failed. Try again.")
//                        print("User has revoked permission to use this cloud service")
                        break
                }
            }
        }
        
        updateTheme()
        debugPrint(inAppPurchaseValidations)
    }
    
    @IBAction func buttonClickPrev(_ sender: Any) {
        if selectedTheme == 0 {
            selectedTheme = inAppPurchaseLabels.count - 1
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
    
    @IBAction func onClickRestorePurchasesButton(_ sender: Any) {
        SwiftyStoreKit.restorePurchases(atomically: true) { results in
            if results.restoreFailedPurchases.count > 0 {
                self.showHUDMessage(messageType: "error", withMessage: "Error restoring purchases.")
//                print("Restore Failed: \(results.restoreFailedPurchases)")
            }
            else if results.restoredPurchases.count > 0 {
                self.showHUDMessage(messageType: "success", withMessage: "Your purchases were restored successfully.")
//                print("Restore Success: \(results.restoredPurchases)")
            }
            else {
                self.showHUDMessage(messageType: "error", withMessage: "Nothing to restore.")
//                print("Nothing to Restore")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadInAppPurchaseData()
        
//        debugPrint(inAppPurchaseLabels)
//        debugPrint(inAppPurchaseDescriptions)
//        debugPrint(inAppPurchasePrices)

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
    
    func loadInAppPurchaseData() {
        for i in 0...inAppPurchaseIds.count - 1 {
            for j in 0...inAppPurchaseIds[i].count - 1 {
                SwiftyStoreKit.retrieveProductsInfo([inAppPurchaseIds[i][j]]) { result in
                    if let product = result.retrievedProducts.first {
                        debugPrint(product)
                        
                        var productPrice = product.localizedPrice!
                        var productLabel = "\(product.localizedTitle)"
                        var productDescription = "\(product.localizedDescription)"
                        var productPurchased = self.verifyPurchase(with: self.inAppPurchaseIds[i][j], sharedSecret: self.sharedSecret)
                        
//                        print("** \(self.inAppPurchaseIds[i][j]) ** \(productPurchased)")
                        
                        self.inAppPurchaseLabels.append(productLabel)
                        self.inAppPurchaseDescriptions.append(productDescription)
                        self.inAppPurchasePrices.append(productPrice)
                        self.inAppPurchaseValidations.append(productPurchased)
                        
                        if j == 0 {
                            var priceLabel = ""
                            
                            self.themePreviewLabel.text = self.inAppPurchaseLabels[0]
                            self.themePreviewDescription.text = self.inAppPurchaseDescriptions[0]
                            
//                            if self.inAppPurchaseValidations[0] == "0" {
                                priceLabel = self.inAppPurchasePrices[0]
//                            }
//                            if self.inAppPurchaseValidations[0] == "1" {
//                                priceLabel = "Purchased"
//                            }
                            
                            self.buyButtonLabel.setTitle(priceLabel, for: .normal)
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
    }
    
    func showHUDMessage(messageType: String, withMessage: String) {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = withMessage
        
        if messageType == "success" {
            hud.indicatorView = JGProgressHUDSuccessIndicatorView()
        } else {
            hud.indicatorView = JGProgressHUDErrorIndicatorView()
        }
        
        hud.show(in: self.view)
        hud.dismiss(afterDelay: 3.0)
    }
    
    func verifyPurchase(with id: String, sharedSecret: String) -> String {
        let appleValidator = AppleReceiptValidator(service: .production, sharedSecret: sharedSecret)
        var valueToReturn = "0"
        
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
    //                    print("\(productId) is purchased: \(receiptItem)")
                       valueToReturn = "1"
                    case .notPurchased:
                       valueToReturn = "0"
    //                    print("The user has never purchased \(productId)")
                }
            case .error(let error):
                valueToReturn = "0"
//                print("Receipt verification failed: \(error)")
            }
        }
        
        return valueToReturn
    }
    
    func updateTheme() {
        var priceLabel = ""
        
        self.themePreviewLabel.text = self.inAppPurchaseLabels[selectedTheme]
        self.themePreviewDescription.text = self.inAppPurchaseDescriptions[selectedTheme]
        self.buyButtonLabel.setTitle(self.inAppPurchasePrices[selectedTheme], for: .normal)
        
        if self.inAppPurchaseValidations[selectedTheme] == "0" {
            priceLabel = self.inAppPurchasePrices[selectedTheme]
        } else {
            priceLabel = "Purchased"
        }
        
        self.buyButtonLabel.setTitle(priceLabel, for: .normal)
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
