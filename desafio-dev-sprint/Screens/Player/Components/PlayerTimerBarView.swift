//
//  PlayerTimeBarView.swift
//  desafio-dev-sprint
//
//  Created by Vitor Conceicao on 25/07/22.
//

import UIKit

final class PlayerTimerBarView: UIView {
    
    private lazy var playImageView: UIImageView = {
        return UIImageView(image: UIImage(named: "play"))
    }()
    
    private lazy var elapsedTimeLabel: UILabel = {
        let elapsedTimeLabel = UILabel()
        elapsedTimeLabel.text = "0:00"
        elapsedTimeLabel.textAlignment = .center
        elapsedTimeLabel.font = .systemFont(ofSize: 9)
        return elapsedTimeLabel
    }()
    
    private lazy var totalTimeLabel: UILabel = {
        let totalTimeLabel = UILabel()
        totalTimeLabel.textAlignment = .center
        totalTimeLabel.font = .systemFont(ofSize: 9)
        totalTimeLabel.setContentHuggingPriority(.init(rawValue: 249), for: .horizontal)
        return totalTimeLabel
    }()
    
    private lazy var indicatorProgressView: UIView = {
        let indicatorProgressView = UIView()
        indicatorProgressView.backgroundColor = .systemGray4
        indicatorProgressView.setContentHuggingPriority(.required, for: .horizontal)
        return indicatorProgressView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fill
        horizontalStackView.spacing = 4
        horizontalStackView.alignment = .center
        return horizontalStackView
    }()
    
    convenience init() {
        self.init(frame: .zero)
        setup()
    }
    
    struct PlayerTimerBarViewConfiguration {
        let totalTime: String
    }
    
    func updateView(with configuration: PlayerTimerBarViewConfiguration) {
        totalTimeLabel.text = configuration.totalTime
    }
    
    func updateElapsedTime(time: String) {
        elapsedTimeLabel.text = time
    }
}

extension PlayerTimerBarView: ViewCode {
    func setupSubviews() {
        horizontalStackView.addArrangedSubview(playImageView)
        horizontalStackView.addArrangedSubview(elapsedTimeLabel)
        horizontalStackView.addArrangedSubview(indicatorProgressView)
        horizontalStackView.addArrangedSubview(totalTimeLabel)
        
        addSubview(horizontalStackView)
    }
    
    func setupConstraint() {
        setupHorizontalStackViewConstraints()
        setupPlayImageViewConstraints()
        setupIndicatorProgressViewConstraints()
    }
    
    private func setupPlayImageViewConstraints() {
        let playImageSize = 30.0
        
        NSLayoutConstraint.activate([
            playImageView.heightAnchor.constraint(equalToConstant: playImageSize),
            playImageView.widthAnchor.constraint(equalToConstant: playImageSize),
        ])
    }
    
    private func setupIndicatorProgressViewConstraints() {
        let indicatorProgressViewHeight = 3.0
        
        NSLayoutConstraint.activate([
            indicatorProgressView.heightAnchor.constraint(equalToConstant: indicatorProgressViewHeight)
        ])
    }
    
    private func setupHorizontalStackViewConstraints() {
        let stackViewHeight = 30.0
        let stackViewSpacing = 5.0
        
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: stackViewSpacing),
            horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -stackViewSpacing),
            horizontalStackView.heightAnchor.constraint(equalToConstant: stackViewHeight)
        ])
    }
}
