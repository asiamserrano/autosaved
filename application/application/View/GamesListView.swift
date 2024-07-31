//
//  GamesListView.swift
//  application
//
//  Created by Asia Serrano on 7/30/24.
//

import SwiftUI
import Extensions
import SwiftData
import Views

struct GamesListView: GamesListViewing {
    
    @Environment(\.modelContext) public var modelContext
    
    @EnvironmentObject var viewer: GamesListViewer
    
    var body: some View {
        Internal(viewer.filter, viewer.sorts)
            .navigationDestination(isPresented: $viewer.addGame, destination: {
                GameView(statusEnum)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    AddGameButton()
                }
            }
    }
    
    struct Internal: GamesListViewing {
        
        @Query var games: Games
        
        @EnvironmentObject var viewer: GamesListViewer
        
        init(_ filter: GamePredicate, _ sorts: GameSortDescriptors) {
            self._games = Query(filter: filter, sort: sorts)
        }
        
        var body: some View {
            SwitcherView(self.isGamesEmpty, left: EmptyListView, right: NonEmptyListView)
                .searchable(text: $viewer.search, prompt: Text("Search for a game"))
                .disabled(self.isGamesEmpty && self.isSearchEmpty)
                .toolbar {
                    
                    if self.games.count > 1 {
                        ToolbarItemGroup(placement: .bottomBar) {
                            SortMenu()
                        }
                    }
                    
                }
        }
        
        private var isGamesEmpty: Bool {
            self.games.isEmpty
        }
        
        @ViewBuilder
        private func NonEmptyListView() -> some View {
            Form {
                List(self.games) { game in
                    NavigationLink(destination: {
                        GameView(game)
                    }, label: {
                        Text(game.display)
                    })
                }
            }
//            Form {
//                List {
//                    ForEach(self.games) { game in
//                        GameNavigationLink(game)
//                            .swipeActions(edge: .trailing) {
//                                DeleteButton(game)
//                            }
//                            .swipeActions(edge: .leading) {
//                                MoveButton(game)
//                            }
//                    }
//                }
//            }
        }
        
       
        
        
        
    }
    
}

//#Preview {
//    NavigationStack {
//        FooView()
//    }
//}
