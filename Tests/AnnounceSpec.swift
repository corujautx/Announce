//
//  AnnounceSpec.swift
//  Announce
//
//  Created by Vitor Travain on 04/10/16.
//  Copyright © 2017 Vitor Travain. All rights reserved.
//

import Quick
import Nimble
@testable import Announce

final class AnnounceSpec: QuickSpec {

    override func spec() {
        describe("Announce") {
            it("announces with a custom presenter") {
                let fakeAnnouncement = FakeAnnouncement()
                let fakePresenter = FakePresenter()

                let token = announce(fakeAnnouncement, withCustomPresenter: fakePresenter)

                expect(fakePresenter.presentedAnnouncement).to(equal(fakeAnnouncement))

                token.dismiss()

                expect(fakePresenter.dismissed).to(beTrue())
            }
        }
    }

}
