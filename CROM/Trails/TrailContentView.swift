//
//  TrailContentView.swift
//  CROM
//
//  Created by Allan Hull on 6/18/23.
//

import SwiftUI

let trailsEndpoint = "https://crom.mobi/trails_crom_ui.json"

struct Trail: Codable, Identifiable {
    public var id: Int
    public var name: String
    public var address: String
    public var city: String
    public var state: String
    public var zip: String
    public var length: String
    public var level: String
    public var type: String
    public var latitude: String
    public var longitude: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case address = "address"
        case city = "city"
        case state = "state"
        case zip = "zip"
        case length = "length"
        case level = "level"
        case type = "type"
        case latitude = "latitude"
        case longitude = "longitude"
    }
    
}

typealias Trails = [Trail]

class TrailDownloader: ObservableObject {
    @Published var trails: Trails = [Trail]()

    init() {
        guard let url = URL(string: trailsEndpoint) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let trails = try JSONDecoder().decode( Trails.self, from: data)
                DispatchQueue.main.async {
                    self.trails = trails
                    print(self.trails)
                }
            } catch {
                print("Error decoding JSON: ", error)
            }
        }.resume()
    }
}


struct TrailContentView: View {
    
    @ObservedObject var trailData: TrailDownloader = TrailDownloader()
    
    var body: some View {
        NavigationView {
            List(self.trailData.trails) { trail in
                NavigationLink(destination: TrailDetailContentView (trail: trail)) {
                Text(trail.name)
            }
           }
        .navigationBarTitle(Text("Trails"))
        }
    }

    
}

struct TrailContentView_Previews: PreviewProvider {
    static var previews: some View {
        TrailContentView()
    }
}
