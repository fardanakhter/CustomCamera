//
//  AppDelegate.swift
//  CustomCamera
//
//  Created by Fardan Akhter on 08/07/2020.
//  Copyright © 2020 Tixsee. All rights reserved.
//
/*
======================================================

* This software and associated documentation files (the “Software”) is

* proprietary to Tixsee LLC.

* All rights reserved. The methods and

* techniques described herein are considered trade secrets

* and/or confidential. Reproduction or distribution, in whole

* or in part, is forbidden except by express written permission

* of Tixsee LLC.

LICENSE RESTRICTIONS

Except as expressly permitted under the License, or unless you have received prior written authorization from Tixsee LLC, you may not use, copy, modify, merge, publish, distribute, decompile, disclose, provide, create a derivative work of, or otherwise make available the Software.

Licenses may not be assigned, encumbered, sublicensed or transferred (whether directly or by operation of law) by the Licensee to any third party, and the Licensee will not grant any license, concession or other rights in or to any one or more of the Licenses to any third party.

See the file "LICENSE" for the full license governing this Software.

The above copyright notice and this license notice shall be included in all copies or substantial portions of the Software.

=============================================
*/

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

