//
//  GamesListViewing.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation
import SwiftUI
import Views
import Extensions

public protocol GamesListViewing: View {
    
    var viewer: GamesListViewer { get }
    
}

public extension GamesListViewing {
    
    var isSearchEmpty: Bool { self.viewer.search.isEmpty }
    var statusEnum: StatusEnum { self.viewer.statusEnum }
    var sortEnum: SortEnum { self.viewer.sortEnum }
    var ascending: Bool { self.viewer.ascending }
    
}

extension GamesListViewing {
    
    @ViewBuilder
    public func AddGameButton() -> some View {
        Button(action: {
            self.viewer.addGame.toggle()
        }, label: {
            Image(systemName: "plus")
        })
    }
    
    @ViewBuilder
    public func SortMenu() -> some View {
        Spacer()
        Menu(content: {
            Picker("SortEnum", selection: sortBinding, content: {
                ForEach(SortEnum.allCases) { sort in
                    HStack {
                        Text(sort.display)
                        if sort == self.sortEnum {
                            IconView("chevron.\(self.ascending ? "up" : "down")")
                        }
                    }
                    .tag(sort)
                }
            })
        }, label: {
            Image(systemName: "ellipsis.circle")
        })
        .menuStyle(BorderlessButtonMenuStyle())
    }
    
    @ViewBuilder
    public func EmptyListView() -> some View {
        VStack {
            Text(emptyPrompt)
                .italic()
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
    }
    
}

private extension GamesListViewing {
    
    var emptyPrompt: String {
        let empty_library: String = "Your \(self.statusEnum.lowercased) is empty.\n Add a game with the '+' button!"
        let empty_results: String = "No results found!"
        return self.isSearchEmpty ? empty_library : empty_results
    }
    
    var sortBinding: Binding<SortEnum> {
        .init(get: {
            self.sortEnum
        }, set: { newValue in
            if newValue == self.sortEnum {
                self.viewer.ascending.toggle()
            } else {
                self.viewer.sortEnum = newValue
                self.viewer.ascending = true
            }
        })
    }
    
}
