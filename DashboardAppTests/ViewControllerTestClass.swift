//
//  ViewControllerTestClass.swift
//  DashboardAppTests
//
//  Created by Prateek's mac mini on 04/09/20.
//  Copyright © 2020 Prateek's mac mini. All rights reserved.
//

import XCTest
@testable import DashboardApp


class ViewControllerTestClass: XCTestCase {

     var viewControllerUnderTest: ViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    }
    
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testHasACollectionView() {
           XCTAssertNotNil(viewControllerUnderTest.collectionView)
    }
    
    func testCollectionViewHasDataSource() {
           XCTAssertNotNil(viewControllerUnderTest.collectionView.dataSource)
    }
    
    func testCollectionViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest.collectionView.delegate)
    }
    
    func testCollectionViewConformsToDataSourceProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UICollectionViewDataSource.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.collectionView(_:numberOfItemsInSection:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.collectionView(_:cellForItemAt:))))
    }

    func testCollectionViewPieChartCellHasReuseIdentifier() {
        let cell = viewControllerUnderTest.collectionView(viewControllerUnderTest.collectionView, cellForItemAt: IndexPath(item: 0, section: 0)) as? PieChartCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "PieChartCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
        
    }
    
    func testCollectionViewColumnChartCellHasReuseIdentifier() {
        let cell = viewControllerUnderTest.collectionView(viewControllerUnderTest.collectionView, cellForItemAt: IndexPath(item: 1, section: 0)) as? ColumnChartCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "ColumnChartCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
        
    }
    
    func testCollectionViewHasReuseIdentifier() {
        let cell = viewControllerUnderTest.collectionView(viewControllerUnderTest.collectionView, cellForItemAt: IndexPath(item: 2, section: 0)) as? PickImageCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "PickImageCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
        
    }
    
    
    
    
    
    
    
    
    
    
    
//
//    func testCollectionViewCellHasChart() {
//        let cell = viewControllerUnderTest.collectionView(viewControllerUnderTest.collectionView, cellForItemAt: IndexPath(item: 0, section: 0)) as? ColumnChartCell
//        XCTAssertNil(cell?.chartView)
//
//
////        let cell1 = viewControllerUnderTest.tableView(viewControllerUnderTest.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as? SideMenuTableViewCell
////        XCTAssertEqual(cell1?.label.text, "two")
////
////        let cell2 = viewControllerUnderTest.tableView(viewControllerUnderTest.tableView, cellForRowAt: IndexPath(row: 2, section: 0)) as? SideMenuTableViewCell
////        XCTAssertEqual(cell2?.label.text, "three")
//    }
    
}



