//
//  ForecastService.swift
//  Alamofire-Weather
//

import Foundation
import Alamofire

class ForecastService {
    
    // Secret Key: c7a51a8adb8cfd37ca8725824ab8f740
    // API URL: https://api.darksky.net/forecast/c7a51a8adb8cfd37ca8725824ab8f740/37.8267,-122.4233
    
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    init(APIKey: String) {
        forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    
    func getCurrentWeather(latitude: Double, longitude: Double, completion: @escaping (CurrentWeather?) -> Void) {
        if let forecastURL = URL(string: "\(forecastBaseURL!)/\(latitude),\(longitude)") {
            Alamofire.request(forecastURL).responseJSON(completionHandler: {
                (response) in
                if let jsonDictonary = response.result.value as? [String: Any] {
                    if let currentWeatherDictonary = jsonDictonary["currently"] as? [String: Any] {
                        let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictonary)
                        completion(currentWeather)
                    } else {
                        completion(nil)
                    }
                }
            })
        }
    }
    
    
}
