//
//  VPSearchWeatherViewController.swift
//  VPCodingChallenge
//
//  Created by intelliswift on 11/4/16.
//  Copyright © 2016 Krishna. All rights reserved.
//

// =================================================================================================
// Imports
// =================================================================================================

import UIKit


class VPSearchWeatherViewController: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    var weatherDetails: WeatherDetails?  = nil
    
    // MARK: - View Controller Life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Get the last searched city from the User default.
        let city = UserDefaults.standard.value(forKey: kLastSearchedCity)
        if let city = city {
            // Get the last searched city from the User default.
            // If last search city is available the prepopulate in the Search bar text field.
            // and make the serach city request.
            self.searchBar.text = city as? String
            self.searchCity(cityName: city as! String)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Table View
    // MARK: - Data Source & Delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // If there is no data the retrun 1
        if self.weatherDetails == nil {
            return 1
        }
        else {
            // Return number of city found in the response for Weather.
            return (self.weatherDetails?.weatherArray.count)!
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VPWeatherCustomCell
        
        if self.weatherDetails != nil {
            let weather = self.weatherDetails?.weatherArray[(indexPath as NSIndexPath).row]
            let deailString = ("\((self.weatherDetails?.name!)!), \((self.weatherDetails?.system?.country)!), \((weather?.description)!)")
            // City Details
            cell.cityInfoLabel.text = deailString
            // Wind speed - I can include more information if needed.
            cell.tempratureInfoLabel.text = "Wind \((self.weatherDetails?.wind?.speed)!) m/s"
            // Geo Coordinates
            cell.coordinateInfoLabel.text = "Geo Coords :[\((self.weatherDetails?.coordinates?.longitude)!), \((self.weatherDetails?.coordinates?.latitude)!)]"
            
            // Download and display the weather condition image icon.
            DispatchQueue.global().async {
                let session = URLSession.shared
                let task:URLSessionTask?
                let str = (weather?.icon)!
                let urlString = kIconURL.appending("\(str).png")
                task = session.dataTask(with: URL.init(string: urlString)!, completionHandler: { responseData, response, error -> Void in
                    DispatchQueue.main.async {
                        cell.weatherIconImageView.image = UIImage.init(data: responseData!)
                    }
                })
                task?.resume();
            }
        }
        return cell
    }
    

    // MARK: - Search Bar Delegate
    func searchBar(_ searchBar: UISearchBar,
                            textDidChange searchText: String) { }

    
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar)  {
    }
    

    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        UserDefaults.standard.setValue(searchBar.text!, forKey: kLastSearchedCity)
        self.searchCity(cityName: searchBar.text!)
    }
    
    
    
    /// Makes Server call to search the weather condition of the city.
    ///
    /// - parameter cityName: cityName
    func searchCity(cityName:String) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let communicationManager = CommunicationManager.sharedInstance
        communicationManager.addRemoteOperation(VPGetWeatherReportRequest.createReqestToGetWeatherReportForCity(cityName: cityName)!) { (data, error) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if error == nil {
                // Parse the data 
                // Ideally parseData should take one more arguments as a clousure(Completion Handler)
                // So the we can handle error well.
                self.weatherDetails = VPGetWetherReportResponse.parseData(data: data!) as WeatherDetails
                if (self.weatherDetails?.status == 200) {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                else {
                    // If city not found then dispay alert, City not found.
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Alert", message:self.weatherDetails?.errorMessage , preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
            else {
                // If error occurs then display alert with appropriate error message.
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Alert", message:"Server is not Responding or Failure" , preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                }
            }
        }
    }
}
