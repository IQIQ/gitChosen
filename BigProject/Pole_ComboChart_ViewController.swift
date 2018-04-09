//
//  Pole_ComboChart_ViewController.swift
//  BigProject
//
//  Created by Thiprat on 4/2/18.
//  Copyright © 2018 Thiprat. All rights reserved.
//

import UIKit
import Charts
import Foundation

class Pole_ComboChart_ViewController: UIViewController {
  
    @IBOutlet weak var barchartView: BarChartView!
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    
    var months: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        months = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]

        print("combines Viewdidload")
        TestsetChart(dataPoints: months, values: StructOperation.atas.DataDoubleBarChart as! [[Double]])

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        months = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
        print("combines viewWillAppear")
        TestsetChart(dataPoints: months, values: StructOperation.atas.DataDoubleBarChart as! [[Double]])
        
    }
    
    var a = 0
    var b = 0
    var c = 0
    
    func TestsetChart(dataPoints: [String], values: [[Double]]) {
        
        
        var ThisChartDataSet: [BarChartDataSet] = []
        var ThisChartData = BarChartData()
        
        while a < StructOperation.atas.idBarChart.count {
            var ThisdataEntries: [BarChartDataEntry] = []
            var ThisdataEntry = BarChartDataEntry()
            
            while b < dataPoints.count{
                ThisdataEntry = BarChartDataEntry(x: Double(b) , y: values[a][b],data: dataPoints[b] as AnyObject)
                ThisdataEntries.append(ThisdataEntry)
                b = b + 1
            }
            let chartDataSet = BarChartDataSet(values: ThisdataEntries, label: StructOperation.atas.idBarChart[a])
            ThisChartDataSet += [chartDataSet]
            
            print(ThisdataEntries)
            
            b = 0
            a = a + 1
            print("-------------------------------------")
            
        }
        
        print("DataSet All: ",ThisChartDataSet)
        ThisChartData = BarChartData(dataSets: ThisChartDataSet)
        print("CD",ThisChartData)
        for c in 0..<ThisChartDataSet.count{
            var colors: [UIColor] = []
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
            ThisChartDataSet[c].colors = colors
        }
        
        let groupSpace = 0.25
        let barSpace = 0.0
        let barWidth = 0.25
        let groupCount = months.count
        let startYear = 0
        
        ThisChartData.barWidth = barWidth
        
        let ii = ThisChartData.entryCount
        print("Int I: \(ii)")
        if ii <= 12{
            barchartView.xAxis.axisMinimum = -0.5
            barchartView.xAxis.axisMaximum = 12
            barchartView.xAxis.centerAxisLabelsEnabled = false
            
        }else{
            barchartView.xAxis.axisMinimum = Double(startYear)
            barchartView.xAxis.axisMaximum = Double(startYear) + ThisChartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace) * Double(groupCount)-0.1
            
            print("Groupspace: \(ThisChartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace))")
            print("max: \(Double(startYear) + ThisChartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace) * Double(groupCount))")
            
            ThisChartData.groupBars(fromX: Double(startYear), groupSpace: groupSpace, barSpace: barSpace)
            barchartView.xAxis.centerAxisLabelsEnabled = true
        }
        
        barchartView.data = ThisChartData
        
        let xaxis = barchartView.xAxis
        xaxis.valueFormatter = axisFormatDelegate
        xaxis.labelPosition = .bottom //lable x
        xaxis.granularityEnabled = true
        xaxis.decimals = 0
        xaxis.wordWrapEnabled = true
        xaxis.drawGridLinesEnabled = false
        barchartView.xAxis.labelFont = UIFont.systemFont(ofSize: 10)
        barchartView.rightAxis.enabled = false //RightAxis
        barchartView.xAxis.labelCount = months.count
        barchartView.xAxis.granularity = barchartView.xAxis.axisMaximum / Double(months.count)
        
        let formatter = CustomLabelsAxisValueFormatter() //callFunc
        formatter.labels = months
        barchartView.xAxis.valueFormatter = formatter
        barchartView.animate(xAxisDuration: 1.5, yAxisDuration: 1.5, easingOption: .linear)
        let leftAxis = barchartView.leftAxis
        leftAxis.spaceTop = 0.35
        leftAxis.axisMinimum = 0
        
        barchartView.chartDescription?.text = ""
        
    }

    //-------------------------Func Refresh----------------
    func refresh(){
        
        print("TestRefresh")
        
        
    }
    //-------------------------Func Refresh----------------

}
