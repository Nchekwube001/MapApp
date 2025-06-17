//
//  LocationView.swift
//  MapApp
//
//  Created by francis on 17/06/2025.
//

import SwiftUI
import MapKit
struct LocationView: View {
    @EnvironmentObject private var vm : LocationsViewModel
  
    var body: some View {
        ZStack{
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            VStack(spacing:0){
                header
                .padding()
                Spacer()
                
                ZStack{
                    ForEach(vm.locations){ location in
                        
                        if(vm.mapLocation == location){
                            
                      
                        LocationPreviewView(location: location)
                            .shadow(color: Color.black.opacity(0.2), radius: 10)
                            .padding()
                            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationsViewModel())
}


extension LocationView {
    private var header : some View {
        VStack{
            
           
            Text(
                vm.mapLocation.name + ", " + vm.mapLocation.cityName
            )
            .font(.title2)
            .fontWeight(.black)
            .foregroundColor(.primary)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .animation(.none, value: vm.mapLocation)
            .overlay(alignment: .leading) {
             
                Button{
                    vm.toggleLocationList()
                }label: {
                    Image(systemName: "arrow.down")
                        .resizable()
                        .frame(width: 18,height: 18 )
                        .foregroundColor(.primary)
                        .padding()
                        .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                }
            }
            if(vm.showLocationsList){
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 15)
    }
}
