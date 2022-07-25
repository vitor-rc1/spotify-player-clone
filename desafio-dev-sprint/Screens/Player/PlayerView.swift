//
//  View.swift
//  desafio-dev-sprint
//
//  Created by Vitor Conceicao on 22/07/22.
//

import UIKit

final class PlayerView: UIView {
    private lazy var coverImageView: UIImageView = {
        let coverImageView = UIImageView(image: UIImage(named: "rush"))
        return coverImageView
    }()
    
    private lazy var bandNameLabel: UILabel = {
        let bandNameLabel = UILabel()
        bandNameLabel.text = "Tom Sawyer"
        bandNameLabel.textAlignment = .center
        bandNameLabel.font = .boldSystemFont(ofSize: 15)
        return bandNameLabel
    }()
    
    private lazy var musicNameLabel: UILabel = {
        let musicNameLabel = UILabel()
        musicNameLabel.text = "Rush - Moving Pictures (2011 Remaster)"
        musicNameLabel.textAlignment = .center
        musicNameLabel.font = .systemFont(ofSize: 13)
        musicNameLabel.textColor = .lightGray
        return musicNameLabel
    }()
    
    private lazy var playerTimerBarView: UIView = {
        let playerTimerBarView = PlayerTimerBarView()
        playerTimerBarView.updateView(with: .init(totalTime: "1:10:31"))
        return playerTimerBarView
    }()
    
    private lazy var playButton: UIButton = {
        let buttonVerticalPadding: CGFloat = 8.0
        let buttonHorizontalPadding: CGFloat = 32.0
        
        let playButton = UIButton(configuration: .filled())
        
        playButton.configuration?.subtitle = "PLAY ON SPOTIFY"
        playButton.configuration?.background.backgroundColor = UIColor(red: 0.153, green: 0.69, blue: 0.38, alpha: 1)
        playButton.configuration?.background.strokeWidth = 2.0
        playButton.configuration?.cornerStyle = .capsule
        playButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: buttonVerticalPadding,
                                                                          leading: buttonHorizontalPadding,
                                                                          bottom: buttonVerticalPadding,
                                                                          trailing: buttonHorizontalPadding)
        return playButton
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackViewSpacing = 4.0
        
        let verticalStackView = UIStackView()
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fill
        verticalStackView.spacing = stackViewSpacing
        verticalStackView.alignment = .center
        return verticalStackView
    }()
    
    convenience init() {
        self.init(frame: .zero)
        setup()
    }
}

extension PlayerView: ViewCode {
    func setupSubviews() {
        verticalStackView.addArrangedSubview(coverImageView)
        verticalStackView.addArrangedSubview(bandNameLabel)
        verticalStackView.addArrangedSubview(musicNameLabel)
        verticalStackView.addArrangedSubview(playerTimerBarView)
        verticalStackView.addArrangedSubview(playButton)
        
        addSubview(verticalStackView)
    }
    
    func setupConstraint() {
        setupVerticalStackViewConstraints()
        setupCoverImageViewConstraints()
        setupPlayerTimerBarViewConstraints()
    }
    
    func setupExtraConfiguration() {
        backgroundColor = .white
    }
    
    private func setupVerticalStackViewConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func setupCoverImageViewConstraints() {
        NSLayoutConstraint.activate([
            coverImageView.heightAnchor.constraint(equalTo: widthAnchor),
            coverImageView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    private func setupPlayerTimerBarViewConstraints() {
        NSLayoutConstraint.activate([
            playerTimerBarView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}
