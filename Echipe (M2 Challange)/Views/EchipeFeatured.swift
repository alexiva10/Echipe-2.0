//
//  EchipeFeatured.swift
//  Echipe (M2 Challange)
//
//  Created by Alex Ivanescu on 26.07.2022.
//

import SwiftUI

struct EchipeFeatured: View {
    
    @EnvironmentObject var model:EchipaModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Best team").bold().padding(.leading).padding(.top, 40).font(.largeTitle)
            
            GeometryReader { geo in
                
                TabView {
                    
                    ForEach (0..<model.echipe.count) { index in
                        if model.echipe[index].name == "Real Madrid" {
                            
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                    
                                VStack(spacing: 0) {
                                    Image("Real Madrid").resizable().aspectRatio( contentMode: .fill).clipped()
                                    Text("Kings").padding(5)
                                }
                            }.frame(width: geo.size.width - 100, height: geo.size.height - 300, alignment: .center)
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
                Text("Details")
                
            }.padding(.leading).padding(.trailing)
        }
    }
}

struct EchipeFeatured_Previews: PreviewProvider {
    static var previews: some View {
        EchipeFeatured().environmentObject(EchipaModel())
    }
}
