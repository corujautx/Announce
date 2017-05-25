//
//  PresenterFactorySpec.swift
//  Announce
//
//  Created by Vitor Travain on 5/25/17.
//  Copyright © 2017 Vitor Travain. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import Announce

final class PresenterFactorySpec: QuickSpec {
    override func spec() {
        describe("A presenter factory") {
            it("should return the correct presenters") {
                let viewPresenter = PresenterFactory.presenter(withContext: .view(UIView()))
                let windowPresenter = PresenterFactory.presenter(withContext: .window)
                let vcPresenter = PresenterFactory.presenter(withContext: .viewController(UIViewController()))

                let timedPresenter = PresenterFactory.presenter(withContext: .view(UIView()), andMode: .timed(5))

                expect(viewPresenter).to(beAnInstanceOf(ViewPresenter.self))
                expect(windowPresenter).to(beAnInstanceOf(WindowPresenter.self))
                expect(vcPresenter).to(beAnInstanceOf(ViewControllerPresenter.self))
                expect(timedPresenter).to(beAnInstanceOf(TimedPresenter.self))
            }
        }
    }
}
