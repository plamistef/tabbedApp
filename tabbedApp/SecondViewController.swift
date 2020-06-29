//
//  SecondViewController.swift
//  tabbedApp
//
//  Created by Plam Stefanova on 6/18/20.
//  Copyright © 2020 Plam Stefanova. All rights reserved.
//

import UIKit
import MapKit
import Foundation

class SecondViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var liveCaseData:Int = 0
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        getLiveStatus()
    }
    func getLiveStatus() {
        
        let today = Date()
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-ddTHH:mm:ssZ"
        let yesterdayString = df.string(from: yesterday)
        let todayString = df.string(from: today)
        
        let urlDenmark = "https://api.covid19api.com/country/denmark/status/confirmed/live?from=\(yesterdayString)&to=\(todayString)"
        
        let semaphore = DispatchSemaphore (value: 0)
        var request = URLRequest(url: URL(string: urlDenmark)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            print("this is data raw")
            print(data)
            let liveData = String(data: data, encoding: .utf8)!
            print("this is live data")
            print(liveData)
            //let strArr = liveData.split{ $0 == "," }
            //print(strArr)
            
            //self.liveCaseData = self.findCases(liveData)
            //print("total case: \(self.liveCaseData)")
        
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
    
    func seperateData(data:String) {
        
        
        
        
        
    }
    
    /*
    func findCases(_ content:String) -> Int {
       
        //let strArr = content.split{ $0 == "," }
        
        //let casesInMainland = strArr[7]
        let casesInGreenland = strArr[17]
        let casesInFaroeIsland = strArr[27]
        
        //let mainlandIndex = casesInMainland.index(casesInMainland.startIndex, offsetBy: 14)
        let greenlandIndex = casesInGreenland.index(casesInGreenland.startIndex, offsetBy: 14)
        let faroeIndex = casesInFaroeIsland.index(casesInFaroeIsland.startIndex, offsetBy: 14)
        
        //let mainlandCase = Int(casesInMainland[mainlandIndex...])!
        let greeenlandCase = Int(casesInGreenland[greenlandIndex...])!
        let faroeCase = Int(casesInFaroeIsland[faroeIndex...])!
    
        let totalCases =  greeenlandCase + faroeCase
        
        return totalCases
    }
 
    */
}

