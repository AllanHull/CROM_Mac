//
//  StoreDetailContentView.swift
//  CROM
//
//  Created by Allan Hull on 6/18/23.
//


import SwiftUI
import MapKit

struct StoreDetailContentView: View {
    
    var store: Store
    
     var body: some View {
   
        VStack {
            
            Form {
                
                // Section 1
                Section(header: Text("Addrress")) {
                    Text(verbatim: store.address + "\n" + store.city + ", " + store.state + ", " + store.zip)
                                .font(.subheadline)
                }
                
                // Section 2
                Section(header: Text("Location")) {
                // display map of event location with pin drop
                MapView(s1: store.latitude, s2: store.longitude, s3: store.name, s4: store.address + "\n" + store.city + ", " + store.state + ", " + store.zip )
                                .frame(height: 140)
                }
                
                // Section 3
                Section(header: Text("Contact Information"))
                {
                    Text(verbatim: "Phone: " + store.phone)
                      .font(.subheadline)
                    Text(verbatim: "Email: " + store.email)
                      .font(.subheadline)
                }
                
                // Section 4
                Section(header: Text("URL")) {
                    Button(action: {
                           print("Store URL")
                           let remoteURL = self.store.url
                           let url: NSURL = URL(string: remoteURL)! as NSURL
                           UIApplication.shared.open(url as URL)
                           }) {
                               Text("Store URL Link")
                                   .font(.system(size:14, weight: .bold))
                                   .foregroundColor(.blue)
                                   .padding()
                                   .border(Color.red, width: 4)
                           }
                }
                
            } // END: Form
                
        }
              .navigationBarTitle(Text(verbatim: store.name), displayMode: .inline)
    }
        
 }
