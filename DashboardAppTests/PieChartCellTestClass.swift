//
//  PieChartCellTestClass.swift
//  DashboardAppTests
//
//  Created by Prateek's mac mini on 04/09/20.
//  Copyright © 2020 Prateek's mac mini. All rights reserved.
//

import XCTest
@testable import DashboardApp

class PieChartCellTestClass: XCTestCase {

    var cell : PieChartCell!
    var viewControllerUnderTest: ViewController!
    let dataPoints = ["abc"]
    let values = [12.0]
    
    
    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
        cell = viewControllerUnderTest.collectionView(viewControllerUnderTest.collectionView, cellForItemAt: IndexPath(item: 0, section: 0)) as? PieChartCell
        cell.stepper.value = 0.0
    }
    
    func testSetStepper(){
        XCTAssertNotNil(cell.stepper)
    }
    
    func testConfigureCell(){
        cell.ConfigureCell(dataPoints: dataPoints, values: values)
        XCTAssertTrue(cell.dataPoints.count > 0)
        XCTAssertTrue(cell.values.count > 0)
    }

    func testSetupPieChart(){
        XCTAssertNotNil(cell.chartView)
    }
    
    func testSetChart(){
        cell.setChart(dataPoints: dataPoints, values: values)
        XCTAssertTrue(cell.dataPoints.count > 0)
        XCTAssertTrue(cell.values.count > 0)
    }
    
}
