//
//  ViewController.swift
//  Announce-Example
//
//  Created by Vitor Travain on 5/23/17.
//  Copyright © 2017 Vitor Travain. All rights reserved.
//

import UIKit
import Announce

final class ViewController: UIViewController {
    private weak var styleSelector: UISegmentedControl?
    private weak var themeSelector: UISegmentedControl?
    private weak var presentationContextSelector: UISegmentedControl?
    private weak var presentationModelSelector: UISegmentedControl?

    private var token: DismissalToken?

    override func loadView() {
        super.loadView()

        view.backgroundColor = .white

        let styleSelector = UISegmentedControl(items: ["Simple message", "Message with title", "Message with image"])
        styleSelector.selectedSegmentIndex = 0

        let themeSelector = UISegmentedControl(items: ["Success", "Info", "Warning", "Danger"])
        themeSelector.selectedSegmentIndex = 0

        let presentationContextSelector = UISegmentedControl(items: ["Window", "View", "View controller"])
        presentationContextSelector.selectedSegmentIndex = 0

        let presentationModeSelector = UISegmentedControl(items: ["5 Seconds", "Indefinite"])
        presentationModeSelector.selectedSegmentIndex = 0

        let button = UIButton(type: .system)
        button.setTitle("Display", for: .normal)
        button.addTarget(self, action: #selector(selectButtonTouched), for: .touchUpInside)

        let dismissButton = UIButton(type: .system)
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissButtonTouched), for: .touchUpInside)

        let buttonStack = UIStackView(arrangedSubviews: [button, dismissButton])
        buttonStack.axis = .horizontal
        buttonStack.spacing = 8.0
        buttonStack.distribution = .fillEqually
        buttonStack.alignment = .fill

        let stackView = UIStackView(arrangedSubviews: [
            themeSelector,
            styleSelector,
            presentationContextSelector,
            presentationModeSelector,
            buttonStack
        ])
        stackView.axis = .vertical
        stackView.spacing = 8.0
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        self.styleSelector = styleSelector
        self.themeSelector = themeSelector
        self.presentationContextSelector = presentationContextSelector
        self.presentationModelSelector = presentationModeSelector

        let leadingConstraint = stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8.0)
        let trailingConstraint = stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8.0)
        let centerYConstraint = stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)

        view.addConstraints([leadingConstraint, trailingConstraint, centerYConstraint])
    }

    @objc func selectButtonTouched() {
        guard let selectedSegment = styleSelector?.selectedSegmentIndex else { return }
        guard let selectedThemeIndex = themeSelector?.selectedSegmentIndex else { return }
        guard let selectedPresentationContextIndex = presentationContextSelector?.selectedSegmentIndex else { return }
        guard let selectedPresentationModeIndex = presentationModelSelector?.selectedSegmentIndex else { return }

        let themes: [Announce.Theme] = [.success, .info, .warning, .danger]
        let selectedTheme = themes[selectedThemeIndex]

        let presentationContexts: [Announce.PresentationContext] = [.window, .view(self.view), .viewController(self)]
        let selectedPresentationContext = presentationContexts[selectedPresentationContextIndex]

        let presentationModes: [Announce.PresentationMode] = [.timed(5), .indefinite]
        let selectedPresentationMode = presentationModes[selectedPresentationModeIndex]

        switch selectedSegment {
        case 0:
            let message = Message(message: "Simple message", theme: selectedTheme)
            token = announce(message, on: selectedPresentationContext, withMode: selectedPresentationMode)
        case 1:
            let message = MessageWithTitle(
                title: "Title",
                message: "A long message...",
                theme: selectedTheme
            )
            token = announce(message, on: selectedPresentationContext, withMode: selectedPresentationMode)
        case 2:
            let message = MessageWithImage(
                title: "Title and image",
                message: "A long message below...",
                image: nil,
                theme: selectedTheme
            )
            token = announce(message, on: selectedPresentationContext, withMode: selectedPresentationMode)
        default:
            return
        }
    }

    @objc func dismissButtonTouched() {
        token?.dismiss()
    }
}

