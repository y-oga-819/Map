//
//  MapView.swift
//  Map
//
//  Created by 小笠原佑樹 on 2022/07/10.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let searchWord: String

    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        print(searchWord)
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(
            searchWord,
            completionHandler: { (placemarks, error) in
            if let unwrapPlacemarks = placemarks,
               let firstPlacemark = unwrapPlacemarks.first,
               let location = firstPlacemark.location {
                let targetCoordinnate = location.coordinate
                print(targetCoordinnate)
                
                let pin = MKPointAnnotation()
                pin.coordinate = targetCoordinnate
                pin.title = searchWord
                uiView.addAnnotation(pin)
                uiView.region = MKCoordinateRegion(
                    center: targetCoordinnate,
                    latitudinalMeters: 500,
                    longitudinalMeters: 500)
            }
        })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchWord: "東京タワー")
    }
}
