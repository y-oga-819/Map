//
//  MapView.swift
//  Map
//
//  Created by 小笠原佑樹 on 2022/07/10.
//

import SwiftUI
import MapKit

struct MapView: View {
     
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.6586,
                                       longitude: 139.7454),
        latitudinalMeters: 1000,
        longitudinalMeters: 1000
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
