import SwiftUI

struct ContentView: View {
    var body : some View{
        NavigationView{
            TopView()
        }
    }
}

struct TopView : View{
    @State var email : String = ""
    @State var password : String = ""
    
    var body : some View{
        ZStack{
            Color.white.opacity(0.3).edgesIgnoringSafeArea(.all)
            VStack(spacing : 18){
                VStack(spacing : 18){
                    Image("login").resizable().frame(width: 40, height: 40)
                }
                .padding(20)
                .modifier(TopModifier())
                .padding(.bottom,30)
                .padding(.top, -30)
                
                HStack(spacing : 15){
                    Image(systemName: "envelope.fill").foregroundColor(.gray)
                    TextField("Enter Mail", text: self.$email)
                }
                .modifier(TextFieldViewModifier())
                
                HStack(spacing : 15){
                    Image(systemName: "eye.fill").foregroundColor(.gray)
                    SecureField("Password", text: self.$password)
                }
                .modifier(TextFieldViewModifier())
                
                Button(action : {
                }){
                    Text("Log-In")
                        .foregroundColor(Color.black.opacity(0.7))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                    
                }
                .buttonStyle(ButtonModifier())
                
                AnimationView()
                Spacer()
            }
            
        }
    }
}


struct AnimationView : View {
    @State var isAnimated : Bool = false
    var body : some View{
        MakeAnimation()
    }
}

struct MakeAnimation : View{
    var body : some View{
        Text("")
    }
}


struct ButtonModifier : ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.white)
            .cornerRadius(15)
            .overlay(
                VStack{
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black.opacity(0.05), lineWidth: 4)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                }
        )
            .shadow(color: Color.black.opacity(configuration.isPressed ? 0 : 0.5), radius: 3, x: 5, y: 5)
        .shadow(color: Color.black.opacity(configuration.isPressed ? 0 : 0.5), radius: 3, x: -5, y: -5)
    }
}


struct TopModifier : ViewModifier{
    func body(content: Content) -> some View {
        content.background(Color.black)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.4), radius: 8, x: -10, y: -10)
            .shadow(color: Color.white.opacity(0.2), radius: 8, x: 8, y: 8)
    }
}

struct TextFieldViewModifier : ViewModifier{
    func body(content: Content) -> some View {
        content.padding(20)
            .frame(width: UIScreen.main.bounds.width - 40)
            .background(Color.white)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black.opacity(0.05), lineWidth: 4)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
        )
    }
}
