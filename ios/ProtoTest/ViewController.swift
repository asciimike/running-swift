//
//  ViewController.swift
//  ProtoTest
//
//  Created by Mike McDonald on 3/22/19.
//  Copyright © 2019 Mike McDonald. All rights reserved.
//

import Foundation
import UIKit

import GTMSessionFetcher

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let baseUrl: String = "https://running-swift-ixmgs6zrpa-uc.a.run.app"
        var urlComponents = URLComponents(string: baseUrl)
        urlComponents?.path = "/users/1"
        
        let requestUrl = urlComponents?.url
        var request = URLRequest(url: requestUrl!)
        request.httpMethod = "GET"
        
        let fetcher = GTMSessionFetcher(request: request)
//        fetcher.beginFetch { (data, error) in
//            let user: User = try! User(serializedData: data!)
//            print(user)
//        }
        
        var urlComponents2 = URLComponents(string: baseUrl)
        urlComponents2?.path = "/users"
        let requestUrl2 = urlComponents2?.url
        
        var request2 = URLRequest(url: requestUrl2!)
        request2.httpMethod = "POST"
        var user = User()
        user.id = "2"
        user.name = "Tina"
        user.email = "tin@domain.com"
        request2.httpBody = try! user.serializedData()
        
        let fetcher2 = GTMSessionFetcher(request: request2)
        fetcher2.beginFetch { (data, error) in
            let user: User = try! User(serializedData: data!)
            print(user)
        }
        
    }


}

