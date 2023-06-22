//
//  Image+Extension.swift
//  autosaved
//
//  Created by Asia Serrano on 6/19/23.
//

import Foundation
import SwiftUI

extension UIImage {
    
    public static var empty: Self {
        Self()
    }
    
    public var data: Data? {
        self.pngData()
    }
    
    public var id: String {
        self.data?.description ?? .empty
    }
    
    public var isEmpty: Bool {
        self.data == nil
    }
    
    public convenience init(_ d: Data?) {
        if let data: Data = d {
            self.init(data: data)!
        } else {
            self.init()
        }
    }

    
    public static func == (lhs: UIImage, rhs: UIImage) -> Bool {
        lhs.data == rhs.data
    }
    
}

extension Image {
    
    public init(_ ui: UIImage) {
        if ui.isEmpty {
            self.init(systemName: "photo.circle.fill")
        } else {
            self.init(uiImage: ui)
        }
    }
    
}
