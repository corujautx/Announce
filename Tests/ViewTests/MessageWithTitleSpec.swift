//
//  MessageWithTitleSpec.swift
//  Announce
//
//  Created by Vitor Travain on 5/25/17.
//  Copyright © 2017 Vitor Travain. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import Announce

final class MessageWithTitleSpec: QuickSpec {
    override func spec() {
        describe("A message with title") {
            let appearance = MessageWithTitleAppearance.defaultAppearance()
            let message = MessageWithTitle(title: "A test title", message: "A test message", appearance: appearance)

            it("assign values") {
                expect(message.title).to(equal("A test title"))
                expect(message.message).to(equal("A test message"))
            }

            it("configures a title") {
                expect(message.titleLabel.text).to(equal("A test title"))

                expect(message.titleLabel.font).to(equal(appearance.titleFont))
                expect(message.titleLabel.textColor).to(equal(appearance.foregroundColor))
                expect(message.titleLabel.numberOfLines).to(equal(1))
                expect(message.titleLabel.textAlignment).to(equal(NSTextAlignment.left))
                expect(message.titleLabel.lineBreakMode).to(equal(NSLineBreakMode.byTruncatingTail))
            }

            it("configures a message") {
                expect(message.messageLabel.text).to(equal("A test message"))

                expect(message.messageLabel.font).to(equal(appearance.messageFont))
                expect(message.messageLabel.textColor).to(equal(appearance.foregroundColor))
                expect(message.messageLabel.numberOfLines).to(equal(0))
                expect(message.messageLabel.textAlignment).to(equal(NSTextAlignment.left))
            }

            it("setups a background color") {
                expect(message.backgroundColor).to(equal(appearance.backgroundColor))
            }
        }
    }
}
