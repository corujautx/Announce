//
//  ThemeSpec.swift
//  Announce
//
//  Created by Vitor Travain on 5/25/17.
//  Copyright © 2017 Vitor Travain. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import Announce

final class ThemeSpec: QuickSpec {
    override func spec() {
        describe("A theme") {
            context("success") {
                let theme = Theme.success

                it("creates message appearance") {
                    let appearance = theme.appearanceForMessage()

                    expect(appearance.font).to(equal(UIFont.systemFont(ofSize: 12.0)))
                    expect(appearance.foregroundColor).to(equal(UIColor.white))
                    expect(appearance.backgroundColor).to(equal(Theme.successBackgroundColor))
                }

                it("creates message with title appearance") {
                    let appearance = theme.appearanceForMessageWithTitle()

                    expect(appearance.titleFont).to(equal(UIFont.boldSystemFont(ofSize: 14.0)))
                    expect(appearance.messageFont).to(equal(UIFont.systemFont(ofSize: 12.0)))
                    expect(appearance.foregroundColor).to(equal(UIColor.white))
                    expect(appearance.backgroundColor).to(equal(Theme.successBackgroundColor))
                }

                it("creates message with image appearance") {
                    let appearance = theme.appearanceForMessageWithImage()

                    expect(appearance.titleFont).to(equal(UIFont.boldSystemFont(ofSize: 14.0)))
                    expect(appearance.messageFont).to(equal(UIFont.systemFont(ofSize: 12.0)))
                    expect(appearance.foregroundColor).to(equal(UIColor.white))
                    expect(appearance.backgroundColor).to(equal(Theme.successBackgroundColor))
                }
            }

            context("info") {
                let theme = Theme.info

                it("creates message appearance") {
                    let appearance = theme.appearanceForMessage()

                    expect(appearance.font).to(equal(UIFont.systemFont(ofSize: 12.0)))
                    expect(appearance.foregroundColor).to(equal(UIColor.white))
                    expect(appearance.backgroundColor).to(equal(Theme.infoBackgroundColor))
                }

                it("creates message with title appearance") {
                    let appearance = theme.appearanceForMessageWithTitle()

                    expect(appearance.titleFont).to(equal(UIFont.boldSystemFont(ofSize: 14.0)))
                    expect(appearance.messageFont).to(equal(UIFont.systemFont(ofSize: 12.0)))
                    expect(appearance.foregroundColor).to(equal(UIColor.white))
                    expect(appearance.backgroundColor).to(equal(Theme.infoBackgroundColor))
                }

                it("creates message with image appearance") {
                    let appearance = theme.appearanceForMessageWithImage()

                    expect(appearance.titleFont).to(equal(UIFont.boldSystemFont(ofSize: 14.0)))
                    expect(appearance.messageFont).to(equal(UIFont.systemFont(ofSize: 12.0)))
                    expect(appearance.foregroundColor).to(equal(UIColor.white))
                    expect(appearance.backgroundColor).to(equal(Theme.infoBackgroundColor))
                }
            }

            context("warning") {
                let theme = Theme.warning

                it("creates message appearance") {
                    let appearance = theme.appearanceForMessage()

                    expect(appearance.font).to(equal(UIFont.systemFont(ofSize: 12.0)))
                    expect(appearance.foregroundColor).to(equal(UIColor.white))
                    expect(appearance.backgroundColor).to(equal(Theme.warningBackgroundColor))
                }

                it("creates message with title appearance") {
                    let appearance = theme.appearanceForMessageWithTitle()

                    expect(appearance.titleFont).to(equal(UIFont.boldSystemFont(ofSize: 14.0)))
                    expect(appearance.messageFont).to(equal(UIFont.systemFont(ofSize: 12.0)))
                    expect(appearance.foregroundColor).to(equal(UIColor.white))
                    expect(appearance.backgroundColor).to(equal(Theme.warningBackgroundColor))
                }

                it("creates message with image appearance") {
                    let appearance = theme.appearanceForMessageWithImage()

                    expect(appearance.titleFont).to(equal(UIFont.boldSystemFont(ofSize: 14.0)))
                    expect(appearance.messageFont).to(equal(UIFont.systemFont(ofSize: 12.0)))
                    expect(appearance.foregroundColor).to(equal(UIColor.white))
                    expect(appearance.backgroundColor).to(equal(Theme.warningBackgroundColor))
                }
            }

            context("danger") {
                let theme = Theme.danger

                it("creates message appearance") {
                    let appearance = theme.appearanceForMessage()

                    expect(appearance.font).to(equal(UIFont.systemFont(ofSize: 12.0)))
                    expect(appearance.foregroundColor).to(equal(UIColor.white))
                    expect(appearance.backgroundColor).to(equal(Theme.dangerBackgroundColor))
                }

                it("creates message with title appearance") {
                    let appearance = theme.appearanceForMessageWithTitle()

                    expect(appearance.titleFont).to(equal(UIFont.boldSystemFont(ofSize: 14.0)))
                    expect(appearance.messageFont).to(equal(UIFont.systemFont(ofSize: 12.0)))
                    expect(appearance.foregroundColor).to(equal(UIColor.white))
                    expect(appearance.backgroundColor).to(equal(Theme.dangerBackgroundColor))
                }

                it("creates message with image appearance") {
                    let appearance = theme.appearanceForMessageWithImage()

                    expect(appearance.titleFont).to(equal(UIFont.boldSystemFont(ofSize: 14.0)))
                    expect(appearance.messageFont).to(equal(UIFont.systemFont(ofSize: 12.0)))
                    expect(appearance.foregroundColor).to(equal(UIColor.white))
                    expect(appearance.backgroundColor).to(equal(Theme.dangerBackgroundColor))
                }
            }
        }
    }
}
