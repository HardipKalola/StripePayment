//
//  ViewController.swift
//  StripeDemo
//
//  Created by Hardip Kalola on 19/12/18.
//  Copyright © 2018 Hardip Kalola. All rights reserved.
//

import UIKit
import Stripe

class ViewController: UIViewController ,STPAddCardViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func actionAddCardDefault(sender: AnyObject) {
        let addCardViewController = STPAddCardViewController()
        addCardViewController.delegate = self
        // STPAddCardViewController must be shown inside a UINavigationController.
        let navigationController = UINavigationController(rootViewController: addCardViewController)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    // MARK: STPAddCardViewControllerDelegate
    
    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreateToken token: STPToken, completion: @escaping STPErrorBlock) {
        //Send token to backend for process
        print(token)
        self.dismiss(animated: true, completion: {
            completion(nil)
        })
    }
}

