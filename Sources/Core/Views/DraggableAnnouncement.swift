//
//  DraggableAnnouncement.swift
//  Announce
//
//  Created by Francesco Perrotti-Garcia on 6/13/17.
//  Copyright © 2017 Announce. All rights reserved.
//

import UIKit

protocol DraggableAnnouncement: Announcement {
    weak var draggableAnnouncementDelegate: DraggableAnnouncementDelegate? { get set }
}

protocol DraggableAnnouncementDelegate: class {
    func boundsDidUpdate(_ newBounds: CGRect)
}
