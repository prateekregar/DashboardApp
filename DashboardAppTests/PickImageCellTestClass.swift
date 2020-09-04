//
//  PickImageCellTestClass.swift
//  DashboardAppTests
//
//  Created by Prateek's mac mini on 04/09/20.
//  Copyright © 2020 Prateek's mac mini. All rights reserved.
//

import XCTest
@testable import DashboardApp

class PickImageCellTestClass: XCTestCase {
    
    var cell : PickImageCell!
    var viewControllerUnderTest: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
        cell = viewControllerUnderTest.collectionView(viewControllerUnderTest.collectionView, cellForItemAt: IndexPath(item: 2, section: 0)) as? PickImageCell
    }
    
    
    func testCellHasImageView(){
        XCTAssertNotNil(cell.imageView)
    }
    
    func testCellHasCaptureButton(){
        XCTAssertNotNil(cell.captureButton)
    }
    
    func testCellHasCancelButton(){
        XCTAssertNotNil(cell.cancelButton)
    }

    
}
