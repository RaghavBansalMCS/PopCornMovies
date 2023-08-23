//
//  MoviesHomeView.swift
//  PopCornMovies
//
//  Created by Consultant on 8/15/23.
//

import SwiftUI

struct MoviesHomeView: View {
    @EnvironmentObject var favourites: Favourites
    @Environment(\.managedObjectContext)  var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var entity: FetchedResults<Entity>
    
    @State private var searchText = ""
    @State private var selectionIndex = 0
    @State private var tabs = ["Now Playing","Upcoming", "Trending"]

   
    
    @StateObject var movieDownloadManager = MovieDownloadManager()
    
    init(){
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().selectionStyle = .none
        
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = .orange
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor:UIColor.orange]
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UISegmentedControl.appearance().backgroundColor = .red.withAlphaComponent(0.0) // Sets the background color of the Picker
        UISegmentedControl.appearance().setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)  // Disappears the divider
        UISegmentedControl.appearance().selectedSegmentTintColor = .red  // Changes the color for the selected item
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)  // Changes the text color for the selected item
        
    }
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text(tabs[selectionIndex])
                    .font(.largeTitle)
                    .bold().italic()
                    .foregroundColor(.red)
                    .padding(.top,20)
                
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.medium)
                    
                    TextField("Search Your Movies", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .italic()
                    

                }
                
            }.padding(.horizontal)
            
               
                
           
            
            //segment control
            
            VStack{
                Picker("_", selection: $selectionIndex){
                    ForEach(0..<tabs.count){ index in
                        Text(tabs[index])
                            .font(.title)
                            .bold().italic()
                            .tag(index)
                        
                        
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .onChange(of: selectionIndex) { (_) in
                        if selectionIndex == 0{
                            movieDownloadManager.getNowPlaying()
                        }else if selectionIndex ==  1{
                            movieDownloadManager.getUpcoming()
                        }else if selectionIndex == 2{
                            movieDownloadManager.getPopular()
                        }
                            
                    }
            }
            
            List{
                ForEach(movieDownloadManager.movies.filter{
                    searchText.isEmpty ? true: $0.title?.lowercased().localizedStandardContains(searchText.lowercased()) ?? true}){
                        movie in
                        
                            NavigationLink {
                                MovieDetailView(movie: movie)
                                    .environmentObject(favourites)
                                    
                                
                            } label: {
                               MoviesViewCell(movie: movie)
                            }.listRowBackground(Color.white)
                            
                        }
                    
            }.task(){
                movieDownloadManager.getNowPlaying()
                
            }
            }
            Spacer()
        }
    
    
    
   
    }



struct MoviesHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesHomeView()
    }
}
