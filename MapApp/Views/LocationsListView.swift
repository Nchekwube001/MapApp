//
//  LocationsListView.swift
//  MapApp
//
//  Created by francis on 17/06/2025.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    var body: some View {
        List{
            if(!vm.locations.isEmpty){
                ForEach(vm.locations){ location in
                    Button{
                        vm.showNextLocation(location: location)
                    }label: {
                        listRowView(location: location)
                    }
               
                        .padding(.vertical,4)
                        .listRowBackground(Color.clear)
                    
                }
            }
            
        }.listStyle(.plain)
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}


extension LocationsListView {
    private func listRowView (location:Location) -> some View{
        HStack{
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45,height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
                
            }
            .frame(maxWidth:.infinity,alignment: .leading)
            HStack{
                if location.cityName == vm.mapLocation.cityName && location.name == vm.mapLocation.name {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 18,height: 18)
//                        .background(Color.green)
                       
                }
            }
           
        
        }
    }
}
