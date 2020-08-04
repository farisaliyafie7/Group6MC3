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

    @IBOutlet weak var pieView: PieChartView!
    //var barChart = BarChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //barChart.delegate = self
        
        setupPieChart()
    }
    
    func setupPieChart(){
        pieView.chartDescription?.enabled = false
        pieView.drawHoleEnabled = false
        pieView.rotationAngle = 0
        pieView.rotationEnabled = false
        pieView.isUserInteractionEnabled = false
        pieView.legend.enabled = false
        
        var entries: [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: 50.0, label: "Takeout"))
        entries.append(PieChartDataEntry(value: 30.0, label: "Healthy Food"))
        entries.append(PieChartDataEntry(value: 20.0, label: "Soft Drink"))
        entries.append(PieChartDataEntry(value: 10.0, label: "Water"))
        entries.append(PieChartDataEntry(value: 40.0, label: "Home Meals"))
        
        let dataSet = PieChartDataSet(entries: entries, label: "")
        let c1 = NSUIColor(hex: 0xFFA500)
        let c2 = NSUIColor(hex: 0x4F0147)
        let c3 = NSUIColor(hex: 0x35012C)
        let c4 = NSUIColor(hex: 0x290025)
        let c5 = NSUIColor(hex: 0x11001C)
        
        dataSet.colors = [c1, c2, c3, c4, c5]
        dataSet.drawValuesEnabled = false
        
        pieView.data = PieChartData(dataSet: dataSet)
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        barChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
//        barChart.center = view.center
//        view.addSubview(barChart)
//
//        var entry = [BarChartDataEntry]()
//        for x in 0..<10{
//            entry.append(BarChartDataEntry(x: Double(x), y: Double(x)))
//        }
//
//        let set = BarChartDataSet(entries: entry)
//        set.colors = ChartColorTemplates.joyful()
//        let data = BarChartData(dataSet: set)
//
//        barChart.data = data
//
//    }

}

extension NSUIColor{
    convenience init(red: Int,green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex: Int){
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF
        )
    }
}
