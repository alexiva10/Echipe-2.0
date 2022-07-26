//
//  EchipeTabView.swift
//  Echipe (M2 Challange)
//
//  Created by Alex Ivanescu on 23.07.2022.
//

import SwiftUI

struct EchipeTabView: View {
    var body: some View {
        
        TabView {
            EchipeFeatured()
                .tabItem {
                    VStack {
                        Image(systemName: "star")
                        Text("Featured")
                    }
                }
            EchipeLista()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("Lista echipe")
                    }
                }
        }
        .environmentObject(EchipaModel())
    }
}

struct EchipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        EchipeTabView()
    }
}
