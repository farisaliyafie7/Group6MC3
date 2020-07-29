//
//  StatisticVC.swift
//  Group6MC3
//
//  Created by Faris Ali Yafie on 24/07/20.
//  Copyright © 2020 Faris Ali Yafie. All rights reserved.
//

import UIKit
import Charts

class StatisticVC: UIViewController, ChartViewDelegate {

    var barChart = BarChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        barChart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        barChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        barChart.center = view.center
        view.addSubview(barChart)
        
        var entry = [BarChartDataEntry]()
        for x in 0..<10{
            entry.append(BarChartDataEntry(x: Double(x), y: Double(x)))
        }
        
        let set = BarChartDataSet(entries: entry)
        set.colors = ChartColorTemplates.joyful()
        let data = BarChartData(dataSet: set)
        
        barChart.data = data
    }

}
