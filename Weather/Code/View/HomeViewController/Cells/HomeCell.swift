//
//  HomeCell.swift
//  Weather
//
//  Created by Toto on 30/07/2019.
//  Copyright © 2019 Toto. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    //MARK: Outlets
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var weatherImageView: UIImageView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    
    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func getHourFromDate(_ weather : WeatherProtocol) -> Int {
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: weather.date)
        let hour = calendar.component(.hour, from: date!)
        return hour
    }
    
    //MARK: Configure Cell
    func configurewith(_ weather: WeatherProtocol, at index: Int) {
        let hour = getHourFromDate(weather)
        self.backgroundColor = WeatherUtils.weatherColor(index: index)
        self.dateLabel.text = WeatherUtils.changeDateFormat(dateString: weather.date)
//        print(dateLabel.text)
        self.temperatureLabel.text = String(format: "%.0f", weather.temperature! - 273.15) + "°C"
        if #available(iOS 13.0, *) {
            if(hour > 20 || hour < 8) {
                self.weatherImageView.image = UIImage(systemName: "moon")
               
                if(weather.rain! > 15.0) { self.weatherImageView.image = UIImage(systemName:  "cloud.moon.rain")}
                
            } else {
                if(weather.temperature! > 293.15) { //si jour + hot
                    self.weatherImageView.image = UIImage(systemName: "thermometer.sun")
                    
                    if(weather.wind! > 25.0) { self.weatherImageView.image = UIImage(systemName: "wind")} //vent
                    if(weather.rain! > 15.0) { self.weatherImageView.image = UIImage(systemName:  "cloud.rain")} //pluie
                }
                if(weather.temperature! < 293.15 && weather.temperature! > 283.15) { //si jour + soleil
                    self.weatherImageView.image = UIImage(systemName: "sun.max")
                    
                    if(weather.wind! > 25.0) { self.weatherImageView.image = UIImage(systemName: "wind")} //vent
                    if(weather.rain! > 15.0) { self.weatherImageView.image = UIImage(systemName:  "cloud.rain")} //pluie
                }
                if(weather.temperature! < 283.15 && weather.temperature! > 273.15) { //si jour + nuageux
                    self.weatherImageView.image = UIImage(systemName: "cloud.sun")
                    
                    if(weather.wind! > 25.0) { self.weatherImageView.image = UIImage(systemName: "wind")} //vent
                    if(weather.rain! > 15.0) { self.weatherImageView.image = UIImage(systemName:  "cloud.rain")} //pluie
                }
                if(weather.temperature! < 273.15 && weather.temperature! > 263.15) { //si jour + nuageux
                    self.weatherImageView.image = UIImage(systemName: "thermometer.snowflake")
                    
                    if(weather.wind! > 25.0) { self.weatherImageView.image = UIImage(systemName: "wind")} //vent
                    if(weather.rain! > 15.0) { self.weatherImageView.image = UIImage(systemName:  "cloud.snow")} //neige
                }
                if(weather.temperature! < 263.15) { //si jour + glaciale
                    self.weatherImageView.image = UIImage(systemName: "thermometer.snowflake")
                    
                    if(weather.wind! > 25.0) { self.weatherImageView.image = UIImage(systemName: "wind")} //vent
                    if(weather.rain! > 15.0) { self.weatherImageView.image = UIImage(systemName:  "cloud.snow")} //neige
                }
            }
            self.weatherImageView.tintColor = .white
        }
    }
}
