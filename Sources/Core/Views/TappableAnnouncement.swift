//
//  TappableAnnouncement.swift
//  Announce-iOS
//
//  Created by Francesco Perrotti Garcia on 11/4/17.
//  Copyright © 2017 Announce. All rights reserved.
//

import Foundation

protocol TappableAnnouncement: Announcement {
    var tapHandler: ((Self) -> Void)? { get }
}
