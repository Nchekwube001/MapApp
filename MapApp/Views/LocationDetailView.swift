//
//  LocationDetailView.swift
//  MapApp
//
//  Created by francis on 17/06/2025.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @EnvironmentObject private var vm : LocationsViewModel
    let location:Location
    var body: some View {
        ScrollView{
            VStack() {
                imageSection
                VStack(alignment: .leading,spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            Button{
                vm.sheetLocation = nil
            }label:{
                Image(systemName: "xmark")
                
            }
            .padding(12)
            .foregroundColor(.primary)
            .background(.thickMaterial)
            .cornerRadius(10)
            .shadow(radius: 4)
            .padding()
        }
        
    }
}

#Preview {
   
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
    
}


extension LocationDetailView {
    private var titleSection: some View {
        VStack(alignment: .leading,spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    private var descriptionSection: some View {
        VStack(alignment: .leading,spacing: 16) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            if let url =  URL(string: location.link) {
            Link(destination: url) {
                Text("Read More")
                    .font(.headline)
            }
                
            }
               
          
        }
    }
    private var imageSection: some View {
        TabView{
            ForEach(location.imageNames,id:\.self){
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
                
                
            }
        }
        .frame(height:500)
        .tabViewStyle(PageTabViewStyle())
    }

//    }
    
    private var mapLayer: some View {
        Map(
            coordinateRegion: .constant(
                MKCoordinateRegion(
                    center: location.coordinates,
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                )
            ),
            annotationItems: [location]) { location in
                MapAnnotation(coordinate: location.coordinates){
                    LocationMapAnnotationView()
                       
                        .shadow(radius: 10)
                     
                }
            }
            .allowsHitTesting(false)
            .aspectRatio(1,contentMode: .fit)
            .cornerRadius(30)
    }
}
