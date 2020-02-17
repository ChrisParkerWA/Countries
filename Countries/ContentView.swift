//
//  ContentView.swift
//  Countries
//
//  Created by Chris Parker on 14/2/20.
//  Copyright © 2020 Chris Parker. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    let countries: [Country] = Bundle.main.decode("countries.json")
    @State private var countries = [Country]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(countries) { country in
                    VStack(alignment: .leading) {
                        Text(country.countryName)
                            .font(.system(size: 18)).bold()
                        Text(country.continentName)
                            .font(.subheadline)
                    }
                }
            }
            .navigationBarTitle("Countries")
            .onAppear(perform: loadData)
        }
    }
    
    func loadData() {
        let url = URL(string: "http://d1058276.myweb.iinethosting.net.au/countries.json")
        let request = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print("There is data")
                if let decodedResponse = try? JSONDecoder().decode([Country].self, from: data) {
                    print("Data decoded.")
                    self.countries = decodedResponse.sorted(by: { $0.countryName < $1.countryName })
                } else {
                    print("No data Decoded.")
                }
                return
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
