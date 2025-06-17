//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by francis on 17/06/2025.
//

import Foundation
import MapKit
import SwiftUI


class LocationsViewModel:ObservableObject{
    @Published var locations : [Location]
    @Published var showLocationsList :Bool = false
    @Published var mapLocation : Location{
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion (location:Location){
        withAnimation(.easeInOut) {
            mapRegion  = MKCoordinateRegion(center:location.coordinates, span: mapSpan)
        }
    }
    
     func toggleLocationList (){
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
     func showNextLocation (location:Location){
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false

        }
    }
    
    func onNextButtonPress (){
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else{
            return
        }
      
        let nextIndex = currentIndex + 1
        print(currentIndex)
        print(locations.count)
        if(nextIndex >= locations.count){
            showNextLocation(location: locations.first!)
        }else{
            showNextLocation(location: locations[nextIndex])
        }
    }
}
