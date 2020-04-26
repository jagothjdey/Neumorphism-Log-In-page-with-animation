import SwiftUI

struct DetailView: View {
    @ObservedObject var moviesViewModel = ListViewModel()
    @State var buttonPressed : Bool = false
    
    @State var isAnimated : Bool = false
    
    var body: some View {
        ZStack{
            VStack(spacing : 0){
                       HeaderView(viewModel: moviesViewModel, buttonPressed : self.$buttonPressed)
                       
                       List{
                           ForEach(moviesViewModel.movies){ movie in
                               CustomCell(movie : movie).offset(x:-10)
                           }
                       }.onAppear {
                           UITableView.appearance().separatorStyle = .none
                       }
                       Spacer()
                   }
        }.animation(
            Animation
            .linear(duration: 5)
            .delay(2)
            .repeatForever(autoreverses: false)
        )
            .onAppear(){
                self.isAnimated = true
        }
        
    }
}

