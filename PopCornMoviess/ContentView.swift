//
//  ContentView.swift
//  PopCornMovies
//
//  Created by Consultant on 8/15/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var favourites = Favourites()
  
    
    @State var selectedTab = 0
    
    var body: some View {
        NavigationStack {
                ZStack(alignment: .bottom){
                         TabView(selection: $selectedTab) {
                             MoviesHomeView()
                                 .environmentObject(favourites)
                                 .tag(0)

                             FavouritesView()
                                 .environmentObject(favourites)
                                 .tag(1)

                             MoviesDiscoveryView()
                                 .environmentObject(favourites)
                                 .tag(2)

                            
                         }
                     }
                    ZStack{
                          HStack{
                              ForEach((TabbedItems.allCases), id: \.self){ item in
                                  Button{
                                      selectedTab = item.rawValue
                                  } label: {
                                      
                                      CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                                  }
                              }
                          }
                          .padding(6)
                      }
                    .frame(width:370, height: 60)
                    .background(.red.opacity(1.0))
                      .cornerRadius(35)
                      .padding(.horizontal, 26)
                
               
        }
    }
}

extension ContentView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
            HStack{
                Spacer()
                Image(imageName)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(isActive ? .black : .white)
                    .frame(width: 30, height: 30)
                    
                if isActive{
                    Text(title)
                        .font(.system(size: 13))
                        .foregroundColor(isActive ? .black : .white)
                    
                }
                Spacer()
            }
           .background(isActive ? .white.opacity(0.3) : .clear)
            .cornerRadius(35)
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
