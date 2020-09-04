//
//  TestCoulmnChartCellClass.swift
//  DashboardAppTests
//
//  Created by Prateek's mac mini on 04/09/20.
//  Copyright © 2020 Prateek's mac mini. All rights reserved.
//

import XCTest
@testable import DashboardApp

class TestCoulmnChartCellClass: XCTestCase {
    
    var cell : ColumnChartCell!
    var viewControllerUnderTest: ViewController!
    let dataPoints = ["abc"]
    let values = [12.0]
    
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
        cell = viewControllerUnderTest.collectionView(viewControllerUnderTest.collectionView, cellForItemAt: IndexPath(item: 1, section: 0)) as? ColumnChartCell
        cell.slider.minimumValue = 1
        cell.slider.maximumValue = 10
    }
    
    func testSetupSlider(){
        XCTAssertNotNil(cell.slider)
    }
    
    func testConfigureCell(){
        cell.ConfigureCell(dataPoints: dataPoints, values: values)
        XCTAssertTrue(cell.dataPoints.count > 0)
        XCTAssertTrue(cell.values.count > 0)
    }
    
    func testSetupBarChart(){
        XCTAssertNotNil(cell.chartView)
    }
    
    func testSetChart(){
        cell.setChart(dataPoints: dataPoints, values: values)
        XCTAssertTrue(cell.dataPoints.count > 0)
        XCTAssertTrue(cell.values.count > 0)
    }
    
}
