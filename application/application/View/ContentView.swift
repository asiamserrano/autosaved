//
//  ContentView.swift
//  application
//
//  Created by Asia Serrano on 7/30/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) public var modelContext

    @State var bool: Bool = true
    @State var menuEnum: MenuEnum = .library
    
    private var gamesListViewer: GamesListViewer {
        .init(self.menuEnum.statusEnum)
    }
    
    var body: some View {
        NavigationStack {
            MainView()
            .navigationTitle("\(self.menuEnum.display)")
            .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        MenuPicker()
                    }
                    
                }
        }
    }

    @ViewBuilder
    private func MainView() -> some View {
        switch menuEnum {
        case .properties:
            BarView()
        default:
            GamesListView()
                .environmentObject(gamesListViewer)
        }
    }
    
    @ViewBuilder
    func MenuPicker() -> some View {
        Menu(content: {
            Picker("MenuEnum", selection: $menuEnum, content: {
                ForEach(MenuEnum.allCases) { menu in
                    HStack {
                        Text(menu.display)
                        Image(systemName: menu.icon)
                    }
                    .tag(menu)
                }
            }).pickerStyle(.automatic)
        }, label: {
            Image(systemName: "line.3.horizontal")
        })
    }
    
}

#Preview {
    
    var undo: UndoManager {
        .init()
    }
    
    let previewModelContainer: ModelContainer = {
        let container: ModelContainer = .preview
        
//        container.mainContext.autosaveEnabled = false
//        container.mainContext.undoManager = undo
        
        for _ in 0..<50 {
            let game: Game = .random()
            container.mainContext.insert(game)
//            try? container.mainContext.save()

        }
        
        return container
    }()
    
    return ContentView()
        .modelContainer(previewModelContainer)
    
}
