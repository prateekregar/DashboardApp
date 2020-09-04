//
//  ColumnCell.swift
//  DashboardApp
//
//  Created by Prateek's mac mini on 03/09/20.
//  Copyright © 2020 Prateek's mac mini. All rights reserved.
//

import UIKit
import Charts

class ColumnChartCell: UICollectionViewCell {
    //MARK: - IBOutlet
    @IBOutlet weak var chartView: BarChartView!
    @IBOutlet weak var slider: UISlider!
    
    //MARK: - vaiables
    var dataPoints = [String]()
    var values = [Double]()
    
    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //MARK: - Custom func
    //setting up slider
    private func setupSlider(){
        slider.minimumValue = 1
        slider.maximumValue = 10
    }
    
    //configure cell for chart and slider
    func ConfigureCell(dataPoints: [String], values: [Double]){
        self.dataPoints = dataPoints
        self.values = values
        self.setupSlider()
        self.setupBarChart()
    }
    
    //MARK: - IBAction
    @IBAction func sliderAction(_ sender: UISlider) {
        let value = slider.value
        print(Int(value))
        self.setChart(dataPoints: dataPoints, values: values, multiplier: Int(sender.value))
    }
    
}

//MARK: - Chart methods
extension ColumnChartCell {
    //setting up bar chart : bar chart configuration
    func setupBarChart() {
        chartView.chartDescription?.enabled = false
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = false
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        chartView.rightAxis.enabled = false
        setChart(dataPoints: dataPoints, values: values)
    }
    
    //setting up data according to stepperValue to PieChart
     func setChart(dataPoints: [String], values: [Double], multiplier: Int = 1) {
        var dataEntries: [BarChartDataEntry] = []
        //create data entries
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: values[i] , y: Double(i) * Double(multiplier))
            dataEntries.append(dataEntry)
        }
        //create data set
        let chartDataSet =  BarChartDataSet(entries: dataEntries, label: "Units Sold")
        let chartData = BarChartData(dataSet: chartDataSet)
        chartView.data = chartData
    }
    
}
