//
//  SelectDayControl.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 09/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

enum Day: Int, CaseIterable {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    var title: String {
        switch self {
        case .monday: return "ПН"
        case .tuesday: return "ВТ"
        case .wednesday: return "СР"
        case .thursday: return "ЧТ"
        case .friday: return "ПТ"
        case .saturday: return "СБ"
        case .sunday: return "ВС"
        }
    }
}


class SelectDayControl: UIControl {
    var selectedDay: Day? {
        didSet {
            updateSelectedDay()
        }
    }

    
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    private func setupView() {
        for day in Day.allCases {
            let button = UIButton(type: .system)
            button.setTitle(day.title, for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectDay(_:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: self.buttons)
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        addSubview(stackView)
    }
    
    private func updateSelectedDay() {
        for (index, button) in buttons.enumerated() {
            guard let day = Day(rawValue: index) else {
                continue
            }
            button.isSelected = day == self.selectedDay
        }
    }

    @objc func selectDay(_ sender: UIButton) {
        guard let index = buttons.index(of: sender),
              let day = Day(rawValue: index)
        else {
            return
        }
        self.selectedDay = day
    }
}
