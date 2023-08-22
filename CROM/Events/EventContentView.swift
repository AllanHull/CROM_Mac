//
//  EventContentView.swift
//  CROM
//
//  Created by Allan Hull on 6/17/23.
//

import SwiftUI

let eventsEndpoint = "https://crom.mobi/events_crom_ui.json"

struct Event: Codable, Identifiable {
    public var id: Int
    public var name: String
    public var address: String
    public var city: String
    public var state: String
    public var zip: String
    public var date: String
    public var category: String
    public var url: String
    public var latitude: String
    public var longitude: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case address = "address"
        case city = "city"
        case state = "state"
        case zip = "zip"
        case date = "date"
        case category = "category"
        case url = "url"
        case latitude = "latitude"
        case longitude = "longitude"
    }
    
}

typealias Events = [Event]

class EventDownloader: ObservableObject {
    @Published var events: Events = [Event]()

    init() {
        guard let url = URL(string: eventsEndpoint) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let events = try JSONDecoder().decode( Events.self, from: data)
                DispatchQueue.main.async {
                    self.events = events
                    print(self.events)
                }
            } catch {
                print("Error decoding JSON: ", error)
            }
        }.resume()
    }
}


struct EventContentView: View {
    
    @ObservedObject var eventData: EventDownloader = EventDownloader()
    
    var body: some View {
        NavigationView {
            List(self.eventData.events) { event in
                NavigationLink(destination: EventDetailContentView(event: event)) {
                    Text(verbatim: event.date + "\n")
                        .font(.system(size:14))
                        .foregroundColor(Color.red)
                        .bold()
                    Text(verbatim: event.name)
                        .font(.system(size:20))
                }
            }
        .navigationBarTitle(Text("Events"))
      }
    }
}

struct EventContentView_Previews: PreviewProvider {
    static var previews: some View {
        EventContentView()
    }
}
