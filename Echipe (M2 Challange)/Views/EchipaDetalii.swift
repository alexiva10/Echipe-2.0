//
//  EchipaDetalii.swift
//  Echipe (M2 Challange)
//
//  Created by Alex Ivanescu on 22.07.2022.
//

import SwiftUI

struct EchipaDetalii: View {
    
    var echipa: Echipa
    
    @State var selectedIstorie = 0
    
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
                VStack (alignment: .center) {
                    Text("Alege perioada istorica: ")
                        .font(.headline)
                        .fontWeight(.bold)
                        
                    Picker("", selection: $selectedIstorie){
                        ForEach (0..<echipa.istorie.count) { i in
                            Text(echipa.istorie[i].titlu).tag(i)
                        }
                    }
                    ForEach(echipa.istorie) { i in
                        //Text($selectedIstorie.i.descriere)
                        if(i.titlu == echipa.istorie[selectedIstorie].titlu) {
                            Text(i.descriere).padding()
                        }
                        
                    }
                }.padding()
                
                
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
