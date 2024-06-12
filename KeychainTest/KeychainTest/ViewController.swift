//
//  ViewController.swift
//  KeychainTest
//
//  Created by Alexey Krzywicki on 11.06.2024.
//
/*
 https://developer.apple.com/documentation/security/keychain_services/keychain_items/sharing_access_to_keychain_items_among_a_collection_of_apps#2973738
 https://developer.apple.com/documentation/security/ksecattraccessgroup
 */

import UIKit
import KeychainAccess

class ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    let accessGroup = "\(Constants.teamID).ru.lexone.SharedItems"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func saveButtonAction(_ sender: Any) {
        let value = "\(Date())"
        let keychain = Keychain(service: Constants.service, accessGroup: accessGroup).synchronizable(true)
        keychain["testKey"] = value
    }
    @IBAction func loadButtonAction(_ sender: Any) {
        let keychain = Keychain(service: Constants.service, accessGroup: accessGroup).synchronizable(true)
        topLabel.text = keychain["testKey"]
    }
}

