//
//  GameView.swift
//  application
//
//  Created by Asia Serrano on 7/30/24.
//

import SwiftUI
import Views
import SwiftData

struct GameView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var wrapper: Game.Wrapper
    
    init(_ status: StatusEnum) {
        _wrapper = .init(wrappedValue: .init(status))
    }
    
    init(_ game: Game) {
        _wrapper = .init(wrappedValue: .init(game))
    }
    
    var body: some View {
        Form {
            Section {
                ClearableTextField($wrapper.title)
            }
            
            Section {
                DatePicker("Release Date", selection: $wrapper.release, displayedComponents: .date)
            }
            
            Section {
                SpacedTextView("previous", self.wrapper.game?.hashValue.description ?? .empty, .regular)
                SpacedTextView("current", self.wrapper.hashValue.description, .regular)
                
//                SpacedTextView("equals", (self.wrapper.game?.hashValue == self.wrapper.hashValue).description, .regular)
//                SpacedTextView("isEmpty",  || self.title.isEmpty.description, .regular)
            }
//            
//            Section {
//                SpacedTextView("changes?", self.modelContext.hasChanges.description, .regular)
//                SpacedTextView("autosave on?", self.modelContext.autosaveEnabled.description, .regular)
//                SpacedTextView("undo count", self.modelContext.undoManager?.undoCount.description ?? "no undoManager", .regular)
//                ForEach(self.modelContext.changedModelsArray, id:\.id) { model in
//                    Text(model.id.hashValue.description)
//                }
//            }
//            Section {
//                SpacedTextView("uuid", game.uuid.shortened, .regular)
//                SpacedTextView("added", game.added.dashless, .regular)
//                SpacedTextView("title_id", game.title_id, .regular)
//                SpacedTextView("title_display", game.title_display, .regular)
//                SpacedTextView("release_date", game.release_date, .regular)
//                SpacedTextView("status_bool", game.status_bool.description, .regular)
//            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            
            ToolbarItem(placement: .topBarLeading) {
                
                Button(action: {
//                    self.modelContext.rollback()
//                    self.modelContext.undoManager?.undo()
//                    self.modelContext.undoManager.
//                    try? self.modelContext.save()
                    self.wrapper.rollback()
                    self.dismiss()
                }, label: {
                    Text("Cancel")
                })
                
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                
                Button(action: {
                    self.modelContext.save(wrapper)
                    self.dismiss()
                }, label: {
                    Text("Done")
                })
                .disabled(wrapper.isUnchanged)
                
            }
            
        }
    }
    
}
