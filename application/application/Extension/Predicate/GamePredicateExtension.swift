//
//  GamePredicateExtension.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation

public typealias GamePredicate = Predicate<Game>

public extension Predicate where repeat each Input: Game {
    
    static func uuids(_ uuids: UUIDS) -> GamePredicate {
        #Predicate {
            uuids.contains($0.uuid)
        }
    }
    
    static func game(_ game: Game) -> GamePredicate {
        let wrapper: Game.Wrapper = .init(game)
        return .wrapper(wrapper)
    }
    
    static func wrapper(_ wrapper: Game.Wrapper) -> GamePredicate {
        let title_id: String = wrapper.title_id
        let release_date: String = wrapper.release_date
        return #Predicate {
            $0.title_id == title_id &&
            $0.release_date == release_date
        }
    }
    
    static func list(_ status: StatusEnum, _ search: String) -> GamePredicate {
        let status_bool: Bool = status.bool
        let canon: String = search.canonicalized
        switch canon.count {
        case 0:
            return #Predicate {
                $0.status_bool == status_bool
            }
        case 1:
            return #Predicate {
                $0.status_bool == status_bool && $0.title_id.starts(with: canon)
            }
        default:
            return #Predicate {
                $0.status_bool == status_bool && $0.title_id.contains(canon)
            }
        }
    }
    
}

