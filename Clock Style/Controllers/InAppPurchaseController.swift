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
    
//    let inAppPurchaseIds = [
//        "clockstyle.themepack4", // Desert
//        "clockstyle.themepack3", // Classic Cars
//        "clockstyle.themepack6", // Tropical
//        "clockstyle.themepack1", // Bridges
//        "clockstyle.themepack7", // Classic Audio
//        "clockstyle.themepack9", // Classic Games
//        "clockstyle.themepack5", // Maps
//        "clockstyle.themepack2", // Bulbs
//        "clockstyle.themepack8", // Classic Cameras
//    ]

    let inAppPurchaseInfo = [
        [ "productId": "clockstyle.themepack1", "label": "Theme Pack - Bridges", "price": "$0.99", "description": "9 additional themes featuring bridges", "image": "clockstyle-theme-bridges"
        ],
        [ "productId": "clockstyle.themepack2", "label": "Theme Pack - Bulbs", "price": "$0.99", "description": "9 additional themes featuring light bulbs", "image": "clockstyle-theme-bulbs"
        ],
        [ "productId": "clockstyle.themepack3", "label": "Theme Pack - Classic Cars", "price": "$0.99", "description": "9 additional themes featuring classic cars", "image": "clockstyle-theme-cars"
        ],
        [ "productId": "clockstyle.themepack4", "label": "Theme Pack - Desert", "price": "$0.99", "description": "9 additional themes featuring deserts", "image": "clockstyle-theme-desert"
        ],
        [ "productId": "clockstyle.themepack5", "label": "Theme Pack - Maps", "price": "$0.99", "description": "9 additional themes featuring maps", "image": "clockstyle-theme-maps"
        ],
        [ "productId": "clockstyle.themepack6", "label": "Theme Pack - Tropical", "price": "$0.99", "description": "9 additional themes featuring tropical images", "image": "clockstyle-theme-tropical"
        ],
        [ "productId": "clockstyle.themepack7", "label": "Theme Pack - Classic Audio", "price": "$0.99", "description": "9 additional themes featuring classic audio", "image": "clockstyle-theme-audio"
        ],
        [ "productId": "clockstyle.themepack8", "label": "Theme Pack - Classic Cameras", "price": "$0.99", "description": "9 additional themes featuring classic cameras", "image": "clockstyle-theme-cameras"
        ],
        [ "productId": "clockstyle.themepack9", "label": "Theme Pack - Classic Games", "price": "$0.99", "description": "9 additional themes featuring classic games", "image": "clockstyle-theme-games"
        ]
    ]
    
    let inAppPurchaseIds = [
        "clockstyle.themepack1", // Bridges
        "clockstyle.themepack2", // Bulbs
        "clockstyle.themepack3", // Classic Cars
        "clockstyle.themepack4", // Desert
        "clockstyle.themepack5", // Maps
        "clockstyle.themepack6", // Tropical
        "clockstyle.themepack7", // Classic Audio
        "clockstyle.themepack8", // Classic Cameras
        "clockstyle.themepack9", // Classic Games
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
    
    fileprivate func purchaseProduct(_ productIdentifierChosen: String) {
        print("Attempt to purchase \(productIdentifierChosen)")
        print("===")
        
        SwiftyStoreKit.purchaseProduct("\(productIdentifierChosen)", quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                //                print("Purchase:")
                //                debugPrint(purchase)
                //                self.inAppPurchaseValidations[self.selectedTheme] = "1"
                //                print(self.inAppPurchaseValidations[self.selectedTheme])
                self.showHUDMessage(messageType: "success", withMessage: "Enjoy this theme!")
                self.updateTheme()
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
    }
    
    
    @IBAction func onClickBuyButton(_ sender: UIButton) {
        let chooseInt = selectedTheme
        let productIdentifierChosen = inAppPurchaseInfo[chooseInt]["productId"]
        let productLabelChosen = inAppPurchaseInfo[chooseInt]["label"]
        //
        print("===")
        print(sender.tag)
        print("selected theme: \(selectedTheme)")
        print("chooseInt: \(chooseInt)")
        
        print(productIdentifierChosen)
        print(productLabelChosen)
        
        print("selectedTheme: \(selectedTheme)")
        //        debugPrint(inAppPurchaseIds)
        //        debugPrint(inAppPurchaseLabels)
        //        debugPrint(inAppPurchaseDescriptions)
        //        print("test: \(inAppPurchaseIds[selectedTheme])")
        purchaseProduct("\(inAppPurchaseIds[chooseInt])")
        //        print("===")
        
        
        //        updateTheme()
        //        debugPrint(inAppPurchaseValidations)
    }
    
    @IBAction func buttonClickPrev(_ sender: Any) {
        if selectedTheme == 0 {
            selectedTheme = inAppPurchaseInfo.count - 1
        } else {
            selectedTheme = selectedTheme - 1
        }
//        print(selectedTheme)
        fillInProductInfo(selectedTheme)
        buyButtonLabel.tag = selectedTheme
        updateTheme()
    }
    
    @IBAction func buttonClickNext(_ sender: Any) {
        if selectedTheme == inAppPurchaseInfo.count - 1 {
            selectedTheme = 0
        } else {
            selectedTheme = selectedTheme + 1
        }
//        print(selectedTheme)
        fillInProductInfo(selectedTheme)
        buyButtonLabel.tag = selectedTheme
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

//        print("###")
//        debugPrint(inAppPurchaseIds)
//        debugPrint(inAppPurchaseLabels)
//        debugPrint(inAppPurchaseDescriptions)
//        debugPrint(inAppPurchasePrices)
//        print("###")
        
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
    
    fileprivate func getProductInfo(productId: String) {
        print("CHECKING \(productId)")
        SwiftyStoreKit.retrieveProductsInfo([productId]) { result in
            debugPrint(result)
            if let product = result.retrievedProducts.first {
                
                let productIdentifier = "\(product.productIdentifier)"
                let productPrice = "\(product.localizedPrice!)"
                let productLabel = "\(product.localizedTitle)"
                let productDescription = "\(product.localizedDescription)"
                let productPurchased = self.verifyPurchase(with: "\(productId)", sharedSecret: self.sharedSecret)
                
                print("\(productIdentifier) --- \(productPrice) \(productLabel) \(productDescription) \(productPurchased)")
                
                self.inAppPurchaseLabels.append(productLabel)
                self.inAppPurchaseDescriptions.append(productDescription)
                self.inAppPurchasePrices.append(productPrice)
                self.inAppPurchaseValidations.append(productPurchased)
                
                if productId == "clockstyle.themepack1" {
                    var priceLabel = ""
                    
                    self.themePreviewLabel.text = self.inAppPurchaseLabels[0]
                    self.themePreviewDescription.text = self.inAppPurchaseDescriptions[0]
                    priceLabel = self.inAppPurchasePrices[0]
                    self.buyButtonLabel.setTitle(priceLabel, for: .normal)
                    self.buyButtonLabel.tag = 0
                    let imageName: UIImage = UIImage(named: "\(self.inAppPurchaseInfo[0]["image"]!)")!
                    self.themePreviewImage.image = imageName
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
    
    fileprivate func fillInProductInfo(_ i: Int) {
        themePreviewLabel.text = inAppPurchaseInfo[i]["label"]
        themePreviewDescription.text = inAppPurchaseInfo[i]["description"]
        let priceLabel = inAppPurchaseInfo[i]["price"]
        buyButtonLabel.setTitle(priceLabel, for: .normal)
        buyButtonLabel.tag = i
    }
    
    func loadInAppPurchaseData() {
        let i = 0
        
        fillInProductInfo(i)
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
        print("SELECTED THEME: \(selectedTheme)")
        
        themePreviewLabel.text = inAppPurchaseInfo[selectedTheme]["label"]
        themePreviewDescription.text = inAppPurchaseInfo[selectedTheme]["description"]
        buyButtonLabel.setTitle(inAppPurchaseInfo[selectedTheme]["price"], for: .normal)
        
        let imageName: UIImage = UIImage(named: "\(inAppPurchaseInfo[selectedTheme]["image"]!)")!
        themePreviewImage.image = imageName
    }

}
