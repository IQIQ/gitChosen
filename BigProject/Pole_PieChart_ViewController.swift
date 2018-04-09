//
//  Pole_PieChart_ViewController.swift
//  BigProject
//
//  Created by Thiprat on 4/2/18.
//  Copyright © 2018 Thiprat. All rights reserved.
//

import UIKit
import Charts
class Pole_PieChart_ViewController: UIViewController {
    
    @IBOutlet weak var PieChartView: PieChartView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChart(values: StructOperation.atas.DataDoublePieChart,dataPoints: StructOperation.atas.idPieChart)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Refresh WillAppear Pie")
        setChart(values: StructOperation.atas.DataDoublePieChart,dataPoints: StructOperation.atas.idPieChart)
        print(StructOperation.atas.idPieChart,StructOperation.atas.DataDoublePieChart)
        
    }

    
    func setChart(values: [Double],dataPoints: [String]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            
            let dataEntry = PieChartDataEntry(value: Double(values[i]), label: dataPoints[i])
            dataEntries.append(dataEntry)
            print(dataEntries)
            print(dataEntry)
            
            
            
        }
        
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "Units Sold")
        
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        
        PieChartView.data = pieChartData
        PieChartView.notifyDataSetChanged()
        PieChartView.animate(xAxisDuration: 0.5, yAxisDuration: 0.5, easingOption: .easeInCirc)
        var colors: [UIColor] = []
        
        for _ in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
        
    }
    

    //-------------------------Func Refresh----------------
    func refresh(){
        
        print("Use func RefreshPie")
        
    }
    //-------------------------Func Refresh----------------

}

