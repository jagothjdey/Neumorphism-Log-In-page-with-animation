import SwiftUI

struct ContentView: View {
    @ObservedObject var moviesViewModel = ListViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.white.opacity(0.5)
                List{
                    ForEach(moviesViewModel.movies){ movie in
                        Text("\(movie.movieRating)")
                    }
                }.onAppear{
                    UITableView.appearance().separatorStyle = .none
                }
            }
        .navigationBarTitle("Movie Rating")
        }
    }
}


