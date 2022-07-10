//
//  MapView.swift
//  Map
//
//  Created by 小笠原佑樹 on 2022/07/10.
//

import SwiftUI
import MapKit

class MapModel: ObservableObject {
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 35.6812362,
            longitude: 139.7671248
        ),
        latitudinalMeters: 1000,
        longitudinalMeters: 1000
    )
    @Published var mapType: MKMapType = .standard
}

struct MapView: View {
    @ObservedObject var mapModel: MapModel

    @State private var userTrackingMode: MapUserTrackingMode = .none

    var body: some View {
        Map(coordinateRegion: $mapModel.region,
            interactionModes: .all,
            showsUserLocation: true,
            userTrackingMode: $userTrackingMode)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(mapModel: MapModel())
    }
}
