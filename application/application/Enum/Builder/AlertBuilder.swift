////
////  AlertBuilder.swift
////  jerseycity
////
////  Created by Asia Serrano on 7/14/24.
////
//
//import Foundation
//import Protocols
//
//public enum AlertBuilder: Hashable {
//    
//    public static func == (lhs: Self, rhs: Self) -> Bool {
//        lhs.hashValue == rhs.hashValue
//    }
//    
//    case none
//    case add(Game, Bool)
//    case delete(Game)
//    case move(Game)
//    case edit(ModelEnum, Bool)
//    
//    public var inserted: Bool {
//        switch self {
//        case .add(_, let bool), .edit(_, let bool):
//            return bool
//        default:
//            return false
//        }
//    }
//    
//    public var title: String {
//        switch self {
//        case .none:
//            return .empty
//        case .add(_, let inserted):
//            return inserted ? "Created Game" : "Failed to Create Game"
//        case .delete(_):
//            return "Delete Game"
//        case .move(_):
//            return "Move Game"
//        case .edit(let modelEnum, let inserted):
//            let model: String = modelEnum.model
//            return inserted ? "Edited \(model)" : "Failed to Edit \(model)"
//        }
//    }
//    
//    public var message: String {
//        switch self {
//        case .none:
//            return .empty
//        case .add(let game, let inserted):
//            let location: String = game.menuEnum.display
//            let display: String = game.display
//            let good: String = "\(display) has been successfully added to your \(location)!"
//            let bad: String = "Unable to add game. \(display) already exists in your \(location)."
//            return inserted ? good : bad
//        case .delete(let game):
//            return "Are you sure you want to delete \(game.display)?"
//        case .move(let game):
//            let location: String = game.menuEnum.next.lowercased
//            return "Are you sure you want to move \(game.display) to your \(location)?"
//        case .edit(let modelEnum, let inserted):
//            return inserted ? modelEnum.positiveEdit : modelEnum.negativeEdit
//        }
//    }
//        
//    public func hash(into hasher: inout Hasher) {
//        switch self {
//        case .none:
//            hasher.combine("none")
//        case .add(let game, let bool):
//            hasher.combine("add")
//            hasher.combine(game.display)
//            hasher.combine(bool)
//        case .delete(let game):
//            hasher.combine("delete")
//            hasher.combine(game.display)
//        case .move(let game):
//            hasher.combine("move")
//            hasher.combine(game.display)
//        case .edit(let modelEnum, let bool):
//            hasher.combine("edit")
//            hasher.combine(modelEnum.display)
//            hasher.combine(bool)
//        }
//    }
//    
//}
