//  AnimationStack.swift
/**
 SOURCE :  https://www.hackingwithswift.com/books/ios-swiftui/controlling-the-animation-stack
 */

import SwiftUI



struct AnimationStack: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var isEnabled: Bool = false
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            Button("\(Image(systemName: "hand.tap"))") {
                isEnabled.toggle()
            }
            .padding(50)
            .background(isEnabled ? Color.blue : Color.red)
            .animation(.default)
            .clipShape(RoundedRectangle(cornerRadius : isEnabled ? 60.0 : 30.0))
            .animation(.interpolatingSpring(stiffness : 60.00 ,
                                            damping : 1.00))
            /**
             For even more control ,
             it is possible to disable animations entirely by passing nil to the modifier .
             For example , you might want the color change to happen immediately
             but the clip shape to retain its animation , in which case you’d write this :
             */
            
            Button("\(Image(systemName: "hand.tap"))") {
                isEnabled.toggle()
            }
            .padding(50)
            .background(isEnabled ? Color.purple : Color.pink)
            .animation(nil)
            .clipShape(RoundedRectangle(cornerRadius : isEnabled ? 60.0 : 30.0))
            .animation(.interpolatingSpring(stiffness : 60.00 ,
                                            damping : 1.00))
            /**
             That kind of control wouldn’t be possible without multiple animation() modifiers
             – if you tried to move `background()` after the animation
             you’d find that it would just undo the work of `clipShape()` .
             */
        }
        .foregroundColor(.white)
        .font(.largeTitle)
    }
}





struct AnimationStack_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AnimationStack().previewDevice("iPhone 12 Pro")
    }
}
