//
//  MessageWithImageSpec.swift
//  Announce
//
//  Created by Vitor Travain on 5/25/17.
//  Copyright © 2017 Vitor Travain. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import Announce

final class MessageWithImageSpec: QuickSpec {
    override func spec() {
        // TODO: implement
        describe("A message with image") {
            let appearance = MessageWithImageAppearance.defaultAppearance()
            let message = MessageWithImage(
                title: "A test title",
                message: "A test message",
                image: nil,
                appearance: appearance
            )

            it("assigns values") {
                expect(message.title).to(equal("A test title"))
                expect(message.message).to(equal("A test message"))
                expect(message.image).to(beNil())
            }

            it("configures its title label") {
                expect(message.titleLabel.text).to(equal("A test title"))

                expect(message.titleLabel.font).to(equal(appearance.titleFont))
                expect(message.titleLabel.textColor).to(equal(appearance.foregroundColor))
                expect(message.titleLabel.textAlignment).to(equal(NSTextAlignment.left))
                expect(message.titleLabel.numberOfLines).to(equal(1))
                expect(message.titleLabel.lineBreakMode).to(equal(NSLineBreakMode.byTruncatingTail))
            }

            it("configures its message label") {
                expect(message.messageLabel.text).to(equal("A test message"))

                expect(message.messageLabel.font).to(equal(appearance.messageFont))
                expect(message.messageLabel.textColor).to(equal(appearance.foregroundColor))
                expect(message.messageLabel.textAlignment).to(equal(NSTextAlignment.left))
                expect(message.messageLabel.numberOfLines).to(equal(0))
            }

            it("configures its image view") {
                expect(message.imageView.image).to(beNil())

                expect(message.imageView.contentMode).to(equal(appearance.imageContentMode))
                expect(message.imageView.layer.cornerRadius).to(equal(appearance.imageCornerRadius))
                expect(message.imageView.layer.masksToBounds).to(beTrue())
            }

            it("configures its background") {
                expect(message.backgroundColor).to(equal(appearance.backgroundColor))
            }
        }
    }
}
