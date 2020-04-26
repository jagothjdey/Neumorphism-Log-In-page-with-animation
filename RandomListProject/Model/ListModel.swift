import Foundation

struct Model : Identifiable, Decodable{
    var id = UUID()
    var movieName : String
    var movieYear : String
    var movieRating : Double
    var backgroundColor : Int
    
    enum CodingKeys: String, CodingKey {
        case movieName = "movie_name"
        case movieYear = "movie_year"
        case movieRating = "movie_rating"
        case backgroundColor = "background_color"
    }
}
