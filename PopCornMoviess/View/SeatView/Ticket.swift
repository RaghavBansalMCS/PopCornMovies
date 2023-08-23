//
//  Ticket.swift
//  PopCornMovies
//
//  Created by Consultant on 8/18/23.
//

import Foundation
import SwiftUI
import CarBode

struct Ticket: View {
    
    @State var movie: Movie
    @StateObject var loader:ImageLoader
    @Binding var selectedSeats:[Seat]
    @Binding var date: TicketDate
    @Binding var hour: String
    @Binding var showTicket: Bool
    @Binding var showSeats: Bool
   


    init(movie: Movie, dataString: String = "---", selectedSeats: Binding<[Seat]>, date: Binding<TicketDate>, hour: Binding<String>, showTicket: Binding<Bool>, showSeats: Binding<Bool>){
        self.movie = movie
        self._selectedSeats = selectedSeats
        self._date = date
        self._hour = hour
        self._showTicket = showTicket
        self._showSeats = showSeats
        _loader = StateObject(wrappedValue: ImageLoader(url: URL(string: movie.posterPath)!, cache: Environment(\.imageCache).wrappedValue))
    }

    var body: some View {

        ZStack {
            ZStack{
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(movie.posterPath)")!) {
                    Rectangle().foregroundColor(Color.gray.opacity(0.4))
                } image: { (img) -> Image in
                    Image(uiImage: img)
                        .resizable()
                }
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
                .blur(radius: 4)
                .padding(-70)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .background(LinearGradient(gradient: Gradient(colors: [.clear, .clear, .white, .white]), startPoint: .top, endPoint: .bottom))
                    .padding(-30)
            }

            CardView(movie: $movie, selectedSeats: $selectedSeats, date: $date, hour: $hour, showTicket: $showTicket, showSeats: $showSeats, dataString: movie.title ?? "-")
        }

    }
    
  
    
}
extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}


struct CardView: View {
    @Binding var movie: Movie
    @Binding var selectedSeats: [Seat]
    @Binding var date: TicketDate
    @Binding var hour: String
    @Binding var showTicket: Bool
    @Binding var showSeats: Bool

    @State var dataString: String
    @State var barcodeType = CBBarcodeView.BarcodeType.barcode128
    @State var rotate = CBBarcodeView.Orientation.up
    @State var barcodeImage: UIImage?
    @State private var showToast = false
 
    

    var body: some View {
        VStack(alignment: .leading){

            VStack{
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(movie.posterPath)")!) {
                    Rectangle().foregroundColor(Color.gray.opacity(0.4))
                } image: { (img) -> Image in
                    Image(uiImage: img)
                        .resizable()
                }.frame(height:UIScreen.main.bounds.height * 0.5)
            }

            VStack(alignment: .center, spacing: 30){

                VStack(alignment: .leading){
                    HStack{
                        Text(movie.title ?? "-")
                            .bold()
                            .font(.system(size: 22))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    Text("101 Marietta Ave, Atlanta")
                        .fontWeight(.light)
                        .foregroundColor(Color(.black))
                }

                HStack(spacing: 30) {
                    VStack {
                        Text("Salon")
                            .font(.system(size: 16))
                            .foregroundColor(.black)

                        Text(String(format: "%.f", Double(5)))
                            .fontWeight(.bold)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                    }

                    VStack {
                        Text("Row")
                            .font(.system(size: 16))
                            .foregroundColor(.black)

                        Text("\(selectedSeats[0].row)")
                            .fontWeight(.bold)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                    }

                    VStack {
                        Text("Movies")
                            .font(.system(size: 16))
                            .foregroundColor(.black)

                        Text(String(format: "%.f", Double(5)))
                            .fontWeight(.bold)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                    }

                    VStack {
                        Text("Seat")
                            .font(.system(size: 16))
                            .foregroundColor(.black)

                        Text("\(selectedSeats[0].number)")
                            .fontWeight(.bold)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Gray2"))
                .cornerRadius(10)

                VStack(alignment: .leading, spacing: 10){
                    HStack(){
                        Text("Cinema").foregroundColor(.gray)
                        Spacer()
                        Text("Movie").foregroundColor(Color(.black))
                    }

                    HStack(){
                        Text("Date").foregroundColor(.gray)
                        Spacer()
                        Text("\(date.day)-\(date.month)-\(date.year)").foregroundColor(Color(.black))
                    }

                    HStack(){
                        Text("Hour").foregroundColor(.gray)
                        Spacer()
                        Text(hour).foregroundColor(Color(.black))
                    }
                }
            }
            .padding()
            .bold()
            .italic()


            LCButton(text: "Save to Photos", action: {
                let image = body.snapshot()
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                withAnimation(Animation.spring().delay(0.5)) {
                    showTicket.toggle()
                    showSeats.toggle()
                }
            }).padding(.horizontal)
              .bold()
              .italic()

            Spacer()
        }.frame(height:UIScreen.main.bounds.height * 0.95)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal, 70)
        .padding(.vertical, 40)
        .shadow(radius: 20)
    }
    
    
}
