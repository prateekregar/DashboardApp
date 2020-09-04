//
//  AppConstants.swift
//  DashboardApp
//
//  Created by Prateek's mac mini on 03/09/20.
//  Copyright © 2020 Prateek's mac mini. All rights reserved.
//

//Note: - AppConstants.swift file contains all the constants of the application here.

import  UIKit

//MARK: - ViewController title
let kHome = "Home"

//MARK: - Application constants
var kIsLandscape: Bool {
    return UIApplication.shared.windows.first?.windowScene?.interfaceOrientation.isLandscape ?? false
}
    
//MARK: - static data structure
   let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun","July","Aug","Sep","Oct","Nov","Dec"]
   let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 12.0,24.0,33.0,35.0,2.0, 12.0]


//MARK: - Others
let kCameraMessage = "Dashboard wants to access your camera settings"
let kSelectImage = "SelectImage"
let kGallery = "Gallary"
let kCamera = "Camera"
let kCancel = "Cancel"
let kOk = "Ok"
