//
//  TrailDetailContentView.swift
//  CROM
//
//  Created by Allan Hull on 6/18/23.
//


import SwiftUI
import MapKit

struct TrailDetailContentView: View {
    
    var trail: Trail
    
    var body: some View {
        
        VStack {
            
            Form {
                
                // Section 1
                 Section(header: Text("Addrress")) {
                     Text(verbatim: trail.address + "\n" + trail.city + ", " + trail.state + ", " + trail.zip)
                                 .font(.subheadline)
                 }
                
                // Section 2
                Section(header: Text("Location")) {
                // display map of event location with pin drop
                MapView(s1: trail.latitude, s2: trail.longitude, s3: trail.name, s4: trail.address + "\n" + trail.city + ", " + trail.state + ", " + trail.zip )
                                .frame(height: 140)
                }
                
                // Section 3
                Section(header: Text("Trail Information"))
                {
                    Text(verbatim: "Type: " + trail.type)
                    Text(verbatim: "Length: " + trail.length)
                    Text(verbatim: "Level: " + trail.level)
                }
                .font(.subheadline)
                              
                
            } // END: Form()
    
        }
        .navigationBarTitle(Text(verbatim: trail.name), displayMode: .inline)
    }

}


