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
    
    //MARK: Configure Cell
    func configurewith(_ weather: WeatherProtocol, at index: Int) {
        self.backgroundColor = WeatherUtils.weatherColor(index: index)
        self.dateLabel.text = WeatherUtils.changeDateFormat(dateString: weather.date) 
        self.temperatureLabel.text = String(format: "%.0f", weather.temperature! - 273.15) + "°C"
        if #available(iOS 13.0, *) {
            if(weather.rain! > 50) { weatherImageView.image = UIImage(systemName: "cloud.rain") }
        }
    }
}
