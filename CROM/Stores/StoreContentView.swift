//
//  StoreContentView.swift
//  CROM
//
//  Created by Allan Hull on 6/18/23.
//


import SwiftUI
import CoreLocation

let storesEndpoint = "https://crom.mobi/stores_crom_ui.json"

struct Store: Codable, Identifiable {
    public var id: Int
    public var name: String
    public var address: String
    public var city: String
    public var state: String
    public var zip: String
    public var phone: String
    public var url: String
    public var email: String
    public var latitude: String
    public var longitude: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case address = "address"
        case city = "city"
        case state = "state"
        case zip = "zip"
        case phone = "phone"
        case url = "url"
        case email = "email"
        case latitude = "latitude"
        case longitude = "longitude"
    }
 
}

typealias Stores = [Store]

class StoreDownloader: ObservableObject {
    @Published var stores: Stores = [Store]()

    init() {
        guard let url = URL(string: storesEndpoint) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let stores = try JSONDecoder().decode(Stores.self, from: data)
                DispatchQueue.main.async {
                    self.stores = stores
                    print(self.stores)
                }
            } catch {
                print("Error decoding JSON: ", error)
            }
        }.resume()
    }
}


struct StoreContentView: View {
 
    @ObservedObject var storeData: StoreDownloader = StoreDownloader()
    
    var body: some View {
        NavigationView {
            List(self.storeData.stores) { store in
                NavigationLink(destination: StoreDetailContentView(store: store)) {
                Text(store.name)
            }
           }
        .navigationBarTitle(Text("Stores"))
        }
    }

}


struct StoreContentView_Previews: PreviewProvider {
    static var previews: some View {
        StoreContentView()
    }
}
