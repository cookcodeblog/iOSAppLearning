//
//  CurrentWeather.swift
//  Alamofire-Weather
//



// JSON: JavaScript object notation
// google preety json

import Foundation

class CurrentWeather {
    
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    let icon: String?
    
    
    struct WeatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
        static let icon = "icon"
    }
    
    init(weatherDictionary: [String: Any]) {
        
        temperature = weatherDictionary[WeatherKeys.temperature] as? Int
        humidity = CurrentWeather.multiplyFactor(weatherDictionary[WeatherKeys.humidity], 100)
        precipProbability = CurrentWeather.multiplyFactor(weatherDictionary[WeatherKeys.precipProbability], 100)
        summary = weatherDictionary[WeatherKeys.summary] as? String
        icon = weatherDictionary[WeatherKeys.icon] as? String
        
   }
    
    // class method, it is like static method belongs to this class
    private class func multiplyFactor(_ rawValue: Any?, _ factor: Double) -> Int? {
        if let rawValueDouble = rawValue as? Double {
            return Int(rawValueDouble * factor)
        } else {
            return nil
        }
    }
}
