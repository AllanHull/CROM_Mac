//
//  EventDetailContentView.swift
//  CROM
//
//  Created by Allan Hull on 6/18/23.
//

import SwiftUI
import MapKit

struct EventDetailContentView: View {
    @ObservedObject var weatherKitManager = WeatherKitManager()

    var event: Event
    
    var body: some View {
        
        VStack {
            
            Form {
                
                // Section 1
                Section(header: Text("Addrress")) {
                    //                  Text(verbatim: event.name)
                    Text(verbatim: event.address + "\n" + event.city + ", " + event.state + ", " + event.zip)
                        .font(.subheadline)
                }
                
                // Section 2
                Section(header: Text("Location")) {
                    // display map of event location with pin drop
                    MapView(s1: event.latitude, s2: event.longitude, s3: event.name, s4: event.address + "\n" + event.city + ", " + event.state + ", " + event.zip )
                        .frame(height: 140)
                }
                
                // Section 3
                Section(header: Text("Date/Weather"))
                {
                    HStack{
                        
                        // Event Date
                        VStack {
                            Text("Event Date")
                            Text(verbatim: event.date)
                        }
                        .font(.subheadline)
                        
                        Spacer()
                        
                        // Weather
                        VStack {
                            Text("Current Weather")
                                .font(.subheadline)
                            Text("Condition  Temp")
                                .font(.subheadline)
                                                
                            // Weather Info
                            Label(weatherKitManager.temp.prefix(2), systemImage: weatherKitManager.symbol)
                                .task {
                                    await weatherKitManager.getWeather(latitude: Double((event.latitude as NSString).doubleValue), longitude: Double((event.longitude as NSString).doubleValue))
                                }
                        }
                        
                    } // END; HStack
                }
                
                // Section 4
                Section(header: Text("Type/URL")) {
                    Text(verbatim: "Type: " + event.category)
                        .font(.subheadline)
                    //
                    // Button: link to store URL
                    //
                    Button(action: {
                        print("Event URL")
                        let remoteURL = self.event.url
                        let url: NSURL = URL(string: remoteURL)! as NSURL
                        UIApplication.shared.open(url as URL)
                    }) {
                        Text("Event URL Link")
                            .font(.system(size:14, weight: .bold))
                            .foregroundColor(.blue)
            //            Text("Event URL Link")
            //                .foregroundColor(.blue)
            //                .font(.title(size:12, weight: .bold))
                            .padding()
                            .border(Color.red, width: 4)
                    }
                }
                
                
            }// END: Form
        }
        .navigationBarTitle(Text(verbatim: event.name), displayMode: .inline)
        
    } // end of View
    
}


//struct EventDetailContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventDetailContentView()
//    }
// }
