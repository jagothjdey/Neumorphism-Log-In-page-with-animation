import Foundation

struct Model : Identifiable, Decodable{
    var id = UUID()
    var movieName : String
    var movieYear : Int
    var movieRating : Double
    
    enum CodingKeys: String, CodingKey {
        case movieName = "movie_name"
        case movieYear = "movie_year"
        case movieRating = "movie_rating"
    }
}
