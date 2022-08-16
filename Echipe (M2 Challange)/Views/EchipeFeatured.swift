//
//  EchipeFeatured.swift
//  Echipe (M2 Challange)
//
//  Created by Alex Ivanescu on 26.07.2022.
//

import SwiftUI

struct EchipeFeatured: View {
    
    @EnvironmentObject var model:EchipaModel
    
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Echipe castigatoare").bold().padding(.leading).padding(.top, 40).font(.largeTitle)
            
            GeometryReader { geo in
                
                TabView (selection: $tabSelectionIndex) {
                    
                    ForEach (0..<model.echipe.count) { index in
                        if model.echipe[index].trofeeUCL > 0 {
                            
                            Button(action: {
                                self.isDetailViewShowing = true
                                
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        
                                    VStack(spacing: 0) {
                                        Image(model.echipe[index].image).resizable().aspectRatio( contentMode: .fill).clipped()
                                        Text(model.echipe[index].name).padding(5)
                                    }
                                }
                            }).tag(index)
                                .sheet(isPresented: $isDetailViewShowing, content: {
                                EchipaDetalii(echipa: model.echipe[index])
                            })
                                .buttonStyle(PlainButtonStyle()).frame(width: geo.size.width - 80, height: geo.size.height - 250, alignment: .center)
                                .cornerRadius(15)
                                .shadow(radius: 10)
                                .shadow(color: .black, radius: 10, x: -5, y: 5)
                        }
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Numar trofee UCL: ").font(.headline)
                Text(model.echipe[tabSelectionIndex].trofeeUCL)
                
                Text("Cei mai buni jucatori: ").font(.headline)
                Text(model.echipe[0].jucatoriTop)
                
            }.padding(.leading).padding(.trailing)
        }
    }
    
}

struct EchipeFeatured_Previews: PreviewProvider {
    static var previews: some View {
        EchipeFeatured().environmentObject(EchipaModel())
    }
}
