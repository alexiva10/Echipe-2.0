//
//  ContentView.swift
//  Echipe (M2 Challange)
//
//  Created by Alex Ivanescu on 22.07.2022.
//

import SwiftUI

struct EchipeLista: View {
    
    @ObservedObject var model = EchipaModel()
    
    var body: some View {
        
        NavigationView {
            List(model.echipe) { e in
                
                NavigationLink {
                    EchipaDetalii(echipa: e)
                } label: {
                    ZStack {
                        Image(e.image).resizable().scaledToFit().padding([.leading, .trailing]).clipped().blur(radius: 7).shadow(color: .black, radius: 10, x: 2, y: 2).cornerRadius(15).frame(width: 300, height: 300, alignment: .center)
                        Text(e.name).font(.largeTitle).fontWeight(.bold).foregroundColor(Color.black).multilineTextAlignment(.center)
                    }
                }.navigationBarTitle("Echipe")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EchipeLista()
    }
}
