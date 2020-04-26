import SwiftUI

struct HeaderView : View{
    var viewModel : ListViewModel
    @Binding var buttonPressed : Bool
    
    @State var doRandomShuffle : Bool = false
    
    var body : some View{
        HStack{
            Text("Movie Rating").font(.title).fontWeight(.bold).padding()
            Spacer()
            Button(action : {
            }){
                RandomRatingButtonView()
            }
        }
    }
}
