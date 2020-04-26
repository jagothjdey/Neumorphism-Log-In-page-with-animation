import Foundation

class ListViewModel : ObservableObject{
    @Published var movies : [Model] = [Model]()
    
    init() {
        self.fetchJSONData()
    }
    
    func fetchJSONData(){
        self.movies.append(Model(movieName: "The Shawshank Redemption", movieYear: "1994", movieRating: 9.2, backgroundColor : 1))
        self.movies.append(Model(movieName: "The Godfather", movieYear: "1972", movieRating: 9.1, backgroundColor : 2))
        self.movies.append(Model(movieName: "The Godfather: Part II ", movieYear: "1974", movieRating: 9.0, backgroundColor : 3))
        self.movies.append(Model(movieName: "The Dark Knight", movieYear: "2008", movieRating: 9, backgroundColor : 4))
        self.movies.append(Model(movieName: "12 Angry Men", movieYear: "1957", movieRating: 8.9, backgroundColor : 5))
        self.movies.append(Model(movieName: "Schindler's List", movieYear: "1993", movieRating: 8.9, backgroundColor : 6))
        self.movies.append(Model(movieName: "Pulp Fiction", movieYear: "1994", movieRating: 8.8, backgroundColor : 7))
        self.movies.append(Model(movieName: "Forrest Gump", movieYear: "1994", movieRating: 8.8, backgroundColor : 8))
        self.movies.append(Model(movieName: "Inception", movieYear: "2010", movieRating: 8.7, backgroundColor : 9))
        self.movies.append(Model(movieName: "The Matrix", movieYear: "1999", movieRating: 8.6, backgroundColor : 10))
        self.sortMoviesAccordingToRating()
    }
    
    func sortMoviesAccordingToRating(){
        self.movies.sort {
            $0.movieRating < $1.movieRating
        }
    }
    
    func randomGenerationOfMovieRating(){
        movies.forEach { (movie) in
            var tempMovies = self.movies
            for i in 0..<10{
                let randomDouble = Double.random(in: 1...10)
                tempMovies[i].movieRating = randomDouble
            }
            self.movies = tempMovies
            self.sortMoviesAccordingToRating()
        }
    }
}
