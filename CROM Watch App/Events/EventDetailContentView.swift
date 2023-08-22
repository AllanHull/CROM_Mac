//
//  EventDetailContentView.swift
//  CROM Watch App
//
//  Created by Allan Hull on 6/18/23.
//

import SwiftUI

struct EventDetailContentView: View {
    
    var event: Event
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(verbatim: event.name)
                .font(.system(size:16))
                .foregroundColor(Color.red)
            Text("\n")
            Text(verbatim: event.address + ", " + event.city + ", " + event.state + ", " + event.zip)
                .font(.system(size:14))
            Text("\n")
            Text(verbatim: "Ride Type: " + event.category)
                .font(.system(size:14))
            Spacer()
        
        }
        
    }
}

// struct EventContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventContentView()
 //   }
//}
