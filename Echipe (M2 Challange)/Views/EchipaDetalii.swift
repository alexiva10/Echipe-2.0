//
//  EchipaDetalii.swift
//  Echipe (M2 Challange)
//
//  Created by Alex Ivanescu on 22.07.2022.
//

import SwiftUI

struct EchipaDetalii: View {
    
    var echipa: Echipa
    
    var body: some View {
        
        ScrollView {
            VStack {
                Image(echipa.image).resizable().scaledToFit().frame(width: 300, height: 300, alignment: .center)
                Spacer()
                Text("Numar trofee UCL: " + String(echipa.trofeeUCL)).font(.headline).padding([.bottom,.top], 30)
                Spacer()
                VStack {
                    Text("Jucatori de top").font(.headline).padding([.bottom,.top], 1)
                    ForEach (echipa.jucatoriTop, id: \.self) { j in
                        Text("# " + j).padding([.bottom,.top], 1)
                    }
                }.padding(.horizontal)
                Spacer()                
            }
        }.navigationTitle(echipa.name)
    }
}

struct EchipaDetalii_Previews: PreviewProvider {
    static var previews: some View {
        let test = EchipaModel()
        
        EchipaDetalii(echipa: test.echipe[0])
    }
}
