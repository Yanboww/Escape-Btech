//
//  TrashGameMainView.swift
//  Escape_Btech
//
//  Created by Student on 5/22/25.
//

import SwiftUI

struct TrashGameMainView: View {
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                
                
                Image("COMPOST BIN").resizable().frame(width:407/3,height:397/3).position(x:geometry.size.width-(407/3)*6,y:geometry.size.height-(397/6))
                Image("TRASH BIN").resizable().frame(width:407/3,height:397/3).position(x:geometry.size.width-(407/3)*3.25,y:geometry.size.height-(397/6))
                Image("RECYCLE BIN").resizable().frame(width:407/3,height:397/3).position(x:geometry.size.width-(407/3/2),y:geometry.size.height-(397/6))
                
            }
            
        }.ignoresSafeArea()
        
        
        
    }
}

#Preview {
    TrashGameMainView()
}
