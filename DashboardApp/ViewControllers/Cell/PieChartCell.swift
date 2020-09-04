//
//  PieChartCell.swift
//  DashboardApp
//
//  Created by Prateek's mac mini on 03/09/20.
//  Copyright © 2020 Prateek's mac mini. All rights reserved.
//

import UIKit
import Charts

class PieChartCell: UICollectionViewCell {
    //MARK: - IBOutlet
    @IBOutlet weak var chartView: PieChartView!
    @IBOutlet weak var stepper: UIStepper!
    
    //MARK: - vaiables
    var dataPoints = [String]()
    var values = [Double]()
    
    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //MARK: - Custom funcs
    //setting up stepper
    private func setupStepper(){
        self.stepper.value = 4.0
        self.stepper.maximumValue = Double(dataPoints.count)
        self.stepper.minimumValue = Double(1)
    }
    
    //configure cell for chart and stepper
    func ConfigureCell(dataPoints: [String], values: [Double]){
        self.dataPoints = dataPoints
        self.values = values
        self.setupStepper()
        self.setupPiChart()
    }
    
    //MARK: - IBAction
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        if Int(sender.value) <= dataPoints.count {
            self.setChart(dataPoints: dataPoints, values: values)
        }
    }
    
}

//MARK: - Chart methods
extension PieChartCell {
    //setting up basic properties for the PieChart
    func setupPiChart(){
        chartView.usePercentValuesEnabled = true
        chartView.drawSlicesUnderHoleEnabled = false
        chartView.holeRadiusPercent = 0.58
        chartView.transparentCircleRadiusPercent = 0.61
        chartView.chartDescription?.enabled = false
        chartView.setExtraOffsets(left: 5, top: 10, right: 5, bottom: 5)
        chartView.drawHoleEnabled = true
        chartView.rotationAngle = 0
        chartView.rotationEnabled = true
        chartView.highlightPerTapEnabled = true
        setChart(dataPoints: months, values: unitsSold)
    }
    
    //setting up data according to stepperValue to PieChart
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        //create data entries
        for i in 0..<Int(stepper.value) {
            let dataEntry1 = PieChartDataEntry(value: values[i], label: dataPoints[i])
            dataEntries.append(dataEntry1)
        }
        
        //create data for pie chart
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "Units Sold")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        chartView.data = pieChartData
        
        var colors: [UIColor] = []
        //create colors for pie chart
        for _ in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
    }
}

