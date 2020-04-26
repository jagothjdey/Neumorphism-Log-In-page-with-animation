import SwiftUI

struct RandomRatingButtonView : View{
    var body : some View{
            Image(systemName: "shuffle")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(20)
                .cornerRadius(20)
                .foregroundColor(Color.black)
    }
}
