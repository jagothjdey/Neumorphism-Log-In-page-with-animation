import SwiftUI

struct ContentView: View {
    var body : some View{
        VStack{
            TopView().padding(.top,40)
            AnimationView()
                .padding(.top,-300)
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
                    Spacer()
                }
        }
    }
}


struct AnimationView : View {
    @State var isAnimated : Bool = false
    private var universalSize = UIScreen.main.bounds
    
    var body : some View{
        ZStack{
            ZStack{
                makeHalfViewAnimation(interval: universalSize.width * 1.5, amplitude: 110, baseHeight: 65 + UIScreen.main.bounds.height/2)
                       .foregroundColor(Color.black.opacity(0.4))
                    .offset(x : self.isAnimated ? -1 * universalSize.width*1.5 : 0)
                .animation(
                    Animation.linear(duration : 5).repeatForever(autoreverses: false)
                )
                
                makeHalfViewAnimation(interval: universalSize.width , amplitude: 200, baseHeight: 70 + UIScreen.main.bounds.height/2)
                       .foregroundColor(Color.black.opacity(0.4))
                    .offset(x : self.isAnimated ? -1 * universalSize.width : 0)
                .animation(
                    Animation.linear(duration : 11).repeatForever(autoreverses: false)
                )
                
                makeHalfViewAnimation(interval: universalSize.width * 3, amplitude: 200, baseHeight: 95 + UIScreen.main.bounds.height/2)
                       .foregroundColor(Color.black.opacity(0.4))
                    .offset(x : self.isAnimated ? -1 * universalSize.width*3 : 0)
                .animation(
                    Animation.linear(duration : 4).repeatForever(autoreverses: false)
                )
                
                makeHalfViewAnimation(interval: universalSize.width * 1.2, amplitude: 50, baseHeight: 75 + UIScreen.main.bounds.height/2)
                       .foregroundColor(Color.black.opacity(0.4))
                    .offset(x : self.isAnimated ? -1 * universalSize.width*1.2 : 0)
                .animation(
                    Animation.linear(duration : 5).repeatForever(autoreverses: false)
                )
                
                
            }
        }.onAppear(){
            self.isAnimated = true
        }
    }
    
    func makeHalfViewAnimation(interval : CGFloat, amplitude : CGFloat, baseHeight : CGFloat) -> Path{
        Path{ path in
            path.move(to : CGPoint(x: 0, y: baseHeight))
            path.addCurve(
                to: CGPoint(x: 1*interval, y: baseHeight),
                control1: CGPoint(x: interval * 0.35, y:  -amplitude + baseHeight),
                control2: CGPoint(x: interval * 0.65, y: amplitude + baseHeight)
            )
            path.addCurve(
                to: CGPoint(x: 2*interval, y: baseHeight),
                control1: CGPoint(x: interval * 1.35, y:  -amplitude + baseHeight),
                control2: CGPoint(x: interval * 1.65, y: amplitude + baseHeight)
            )
            path.addLine(to: CGPoint(x: 2*interval, y: universalSize.height))
            path.addLine(to: CGPoint(x: 0, y: universalSize.height))
        }
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
        content.background(Color.black.opacity(0.4))
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
