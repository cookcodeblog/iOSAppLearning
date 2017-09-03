//
//  CurrentWeatherViewController.swift
//  Alamofire-Weather
//


import UIKit

class CurrentWeatherViewController: UIViewController {

    @IBOutlet weak var cityTextLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var temperatureScaleLabel: UILabel!

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    let forecastAPIKey = "c7a51a8adb8cfd37ca8725824ab8f740"
    let coordinate: (lat: Double, long: Double) = (37.8267,-122.4233)
    var forecastService: ForecastService!
    
    // do something after the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getCurrentWeather(latitude: coordinate.lat, longitude: coordinate.long) { (currentWeather) in
                if let currentWeather  = currentWeather {
                    DispatchQueue.main.async {
                        if let temperature = currentWeather.temperature {
                            self.temperatureLabel.text = "\(temperature)°"
                        } else {
                            self.temperatureLabel.text = "-"
                        }
                    }
                }
        }
    }
    
    
    
}
