//
//  MenuBarView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/09/28.
//import SwiftUI

import SwiftUI

struct SidebarView: View {
    var body: some View {
//        NavigationView {
            #if os(iOS)
            SidebarViewContent()
                .navigationTitle("Code")
            #else
            SidebarViewContent()
                .frame(minWidth: 200, idealWidth: 250,maxWidth: 300)
            #endif
//        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}

struct SidebarViewContent: View {
    var body: some View {
        List {
            Label("Books", systemImage: "book.closed")
            Label("Tutorials", systemImage: "list.bullet.rectangle")
            Label("Video Tutorials", systemImage: "tv")
            Label("Contacts", systemImage: "mail.stack")
            Label("Search", systemImage: "magnifyingglass")
        }
        .listStyle(SidebarListStyle())
    }
}
