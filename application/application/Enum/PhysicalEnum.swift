//
//  PhysicalEnum.swift
//  autosaveProject
//
//  Created by Asia Michelle Serrano on 6/20/24.
//

import Foundation
import Protocols

public enum PhysicalEnum: Enumerating {
    
    case disc, cartridge, card
    
    public var format: FormatEnum { .physical }

}
