import SwiftUI

struct ContentView: View {
    @State var text = "hello world!"
    
    var body: some View {
        VStack {
            Text(text)
            HStack {
                Button(action: {
                    text = "good bye"
                }, label: {
                    Text("Start")
                }).foregroundColor(.red)
                
                Spacer()
                
                Button(action: {
                    text = "yeahhhhh"
                }, label: {
                    Text("Reset")
                }).foregroundColor(.blue)
                
            }.buttonStyle(CircleStyle())
            .padding(30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CircleStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.modifier(ButtonCircle())
    }
}


struct ButtonCircle: ViewModifier {
    func body(content: Content) -> some View {
        let background = Circle()
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(Color.white)
                            .padding(4)
                    ).frame(width: 100, height: 100)
        let foreground = content
            .padding(20)
            .foregroundColor(.white)
        return foreground.background(background)
    }
}
