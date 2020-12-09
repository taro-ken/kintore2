//
//  main.swift
//  kintore2
//
//  Created by 木元健太郎 on 2020/08/09.
//  Copyright © 2020 kimoto kentaro. All rights reserved.
//

import Foundation
import UIKit


if NSClassFromString("XCTestCase") != nil {
    UIApplicationMain(
        Process.argc,
        Process.unsafeArgv,
        NSStringFromClass(UIApplication),
        NSStringFromClass(TestingAppDelegate)
    )
} else {
    UIApplicationMain(
        Process.argc,
        Process.unsafeArgv,
        NSStringFromClass(UIApplication),
        NSStringFromClass(AppDelegate)
    )
}
