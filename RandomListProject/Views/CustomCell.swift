import SwiftUI

struct CustomCell: View {
    var movie : Model
    var body: some View {
        ZStack{
            ColorExtension.getBackgroundColor(colorID: movie.backgroundColor)
            VStack{
                HStack{
                    Text("\(movie.movieName)")
                    .font(.system(.title, design: .rounded))
                        .padding()
                    Spacer()
                }
                HStack{
                    Text("IMDb Rating \(movie.movieRating, specifier: "%.1f")")
                    .font(.system(.callout, design: .rounded))
                    .padding()
                    
                    Spacer().frame(width : 10)
                    
                    Text("Year : \(movie.movieYear)")
                    .font(.system(.callout, design: .rounded))
                        .padding()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width - 10)
    .cornerRadius(10)
    }
}
