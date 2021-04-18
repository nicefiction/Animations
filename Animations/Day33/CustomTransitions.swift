///  CustomTransitions.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/building-custom-transitions-using-viewmodifier
 
 It is possible – and actually surprisingly easy –
 to create wholly new transitions for SwiftUI ,
 allowing us to add and remove views using entirely custom animations .
 This functionality is made possible by the `.modifier` transition ,
 which accepts any view modifier we want .
 The catch is that we need to be able to instantiate the modifier ,
 which means it needs to be one we create ourselves .
 */

import SwiftUI



struct CornerRotateModifier: ViewModifier {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    var amount: Double
    var anchor: UnitPoint
    
    
    
     // //////////////
    //  MARK: METHODS
    
    func body(content: Content)
    -> some View {
        
        content.rotationEffect(.degrees(amount) ,anchor : anchor)
            .clipped()
        /**
         The addition of `clipped()` there means
         that when the view rotates
         the parts that are lying outside its natural rectangle
         don’t get drawn .
         */
    }
}
/**
 We can try that straight away
 using the `.modifier transition` ,
 but it is a little unwieldy .
 A better idea is to wrap that in an `extension` to `AnyTransition` ,
 making it rotate from -90 to 0 on its _top leading_ corner :
 */
extension AnyTransition {
    
    static var pivot: AnyTransition {
        
        .modifier(
            active : CornerRotateModifier(amount : -90.00 , anchor : .topLeading) ,
            identity : CornerRotateModifier(amount : 0 , anchor : .topLeading)
        )
    }
}



struct CustomTransitions: View {
    
     // ///////////////////////
    // MARK: PROPERTY WRAPPERS
    
    @State private var isShowingRectangle: Bool = false
    
    
    
     // /////////////////////////
    // MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            Button("Tap Me") {
                withAnimation(Animation.default) {
                    isShowingRectangle.toggle()
                }
            }
            
            
            if isShowingRectangle {
                Rectangle()
                    .frame(width : 200 ,
                           height : 200 * 0.618 ,
                           alignment : .center)
                    .foregroundColor(.blue)
                    .transition(.pivot)
            }
        }
    }
}





struct CustomTransitions_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CustomTransitions().previewDevice("iPhone 12 Pro")
    }
}
