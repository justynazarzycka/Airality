//
//  MapView.swift
//  Airality
//
//  Created by Justyna Zarzycka on 22/03/2021.
//

import SwiftUI
import MapKit

struct CityMapView: View {
    var stationCoordinates: Station.Location
    
    var locationCoordinate: CLLocationCoordinate2D {
          CLLocationCoordinate2D(
            latitude: stationCoordinates.coordinates[1],
            longitude: stationCoordinates.coordinates[0])
      }
    
    var body: some View {
        MapView(coordinate: locationCoordinate)
            .frame(height: 230)
            .cornerRadius(25)
            .shadow(radius: 7)
    }
}

struct CityMapView_Previews: PreviewProvider {
    static var previews: some View {
        CityMapView(stationCoordinates: Station.testData.data.location)
    }
}
