//
//  BarView.swift
//  application
//
//  Created by Asia Serrano on 7/30/24.
//

import SwiftUI

struct BarView: View {
    var body: some View {
        Form {
            Section {
                Text("Hello, world!")
            }
        }
        
        .navigationTitle("Bar View")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack {
        BarView()
    }
}
