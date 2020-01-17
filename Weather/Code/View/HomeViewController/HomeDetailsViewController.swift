//
//  HomeDetailsViewController.swift
//  Weather
//
//  Created by Thomas MARTIN.
//  Copyright © 2019 Thomas MARTIN. All rights reserved.
//

import UIKit

class HomeDetailsViewController: UIViewController {
    
    
    // I did not chose to do this view programmatically like the HomeViewController. Just to kill the fun.
    
   //MARK: Property
    var weather: WeatherProtocol?
    var backgroundColor: UIColor?
    @IBOutlet var mainStackView: UIStackView!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var humidityValue: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var pressureValue: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var rainValue: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var windValue: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    //MARK: Life Cycle
       override func loadView() {
           super.loadView()
           
        self.navigationController?.navigationBar.tintColor = backgroundColor
        self.dataView.backgroundColor = backgroundColor
        self.mainView.backgroundColor = backgroundColor
        self.setup()
       }
    
    //MARK: Setup Functions
    private func setup() {
        self.setupDateLabel()
        self.setupTemperatureLabel()
        self.setupHumidity()
        self.setupHumidityValue()
        self.setupPressure()
        self.setupPressureValue()
        self.setupRain()
        self.setupRainValue()
        self.setupWind()
        self.setupWindValue()
    }
    
    private func setupDateLabel() {
        self.dateLabel.text = WeatherUtils.changeDateFormat(dateString: weather!.date)
        self.dateLabel.textColor = UIColor.white
        self.dateLabel.textAlignment = .center
        self.dateLabel.font = UIFont.systemFont(ofSize: 30)
    }
    
    private func setupTemperatureLabel() {
        if let temperature = weather?.temperature {
            self.temperatureLabel.text = String(format: "%.0f", temperature - 273.15) + "°C"
        } else {
            self.temperatureLabel.text = "Error"
        }
        self.temperatureLabel.textColor = UIColor.white
        self.temperatureLabel.font = UIFont.systemFont(ofSize: 100)
    }
    
    private func setupHumidity() {
        self.humidityLabel.text = "Humidité"
        self.humidityLabel.textColor = UIColor.white
        self.humidityLabel.textAlignment = .left
        self.humidityLabel.font = UIFont.systemFont(ofSize: 30)
    }
    
    private func setupHumidityValue() {
        self.humidityValue.text = "\(weather?.humidity ?? 0)"
        self.humidityValue.textColor = UIColor.white
        self.humidityValue.textAlignment = .right
        self.humidityValue.font = UIFont.systemFont(ofSize: 30)
    }
    
    private func setupPressure() {
        self.pressureLabel.text = "Pression"
        self.pressureLabel.textColor = UIColor.white
        self.pressureLabel.textAlignment = .left
        self.pressureLabel.font = UIFont.systemFont(ofSize: 30)
    }
    
    private func setupPressureValue() {
        self.pressureValue.text = "\(weather?.pressure ?? 0)"
        self.pressureValue.textColor = UIColor.white
        self.pressureValue.textAlignment = .right
        self.pressureValue.font = UIFont.systemFont(ofSize: 30)
    }
    
    private func setupRain() {
        self.rainLabel.text = "Pluie"
        self.rainLabel.textColor = UIColor.white
        self.rainLabel.textAlignment = .left
        self.rainLabel.font = UIFont.systemFont(ofSize: 30)
    }
    
    private func setupRainValue() {
        self.rainValue.text = "\(weather?.rain ?? 0)"
        self.rainValue.textColor = UIColor.white
        self.rainValue.textAlignment = .right
        self.rainValue.font = UIFont.systemFont(ofSize: 30)
    }
    
    private func setupWind() {
        self.windLabel.text = "Vent"
        self.windLabel.textColor = UIColor.white
        self.windLabel.textAlignment = .left
        self.windLabel.font = UIFont.systemFont(ofSize: 30)
    }
    
    private func setupWindValue() {
        self.windValue.text = "\(weather?.wind ?? 0)"
        self.windValue.textColor = UIColor.white
        self.windValue.textAlignment = .right
        self.windValue.font = UIFont.systemFont(ofSize: 30)
    }
}


