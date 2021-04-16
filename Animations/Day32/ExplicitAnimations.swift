//  ExplicitAnimations.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/creating-explicit-animations
 
 You have seen how SwiftUI lets us create implicit animations
 (`1`) by attaching the `animation()` modifier to a view ,
 and (`2`) how it also lets us create animated binding changes
 by adding the `animation()` modifier to a binding ,
 but (`3`)  there is a third useful way we can create animations :
 explicitly asking SwiftUI to animate changes occurring
 as the result of a state change :
 */

import SwiftUI



struct ExplicitAnimations: View {
    
     // ///////////////////////
    // MARK: PROPERTY WRAPPERS
    
    @State private var animationAmount: CGFloat = 0.00
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            Button("Tap Me") {
                // Do Something
                withAnimation {
                    self.animationAmount += 360
                }
            }
            .padding(40)
            .background(Color.blue)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(Double(animationAmount)) ,
                              axis : (x : 0.0 , y : 1.0 , z : 0.0))
            
            /**
             `withAnimation()` can be given an animation parameter ,
             using all the same animations you can use elsewhere in SwiftUI :
             */
            Button("Tap Me") {
                // Do Something
                withAnimation(
                    Animation
                        .interpolatingSpring(stiffness: 5.00 ,
                                             damping: 1.00)) {

                    self.animationAmount += 360
                }
                // OLIVIER : The interpolatingSpring effect affects both buttons ?
            }
            .padding(40)
            .background(Color.pink)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(Double(animationAmount)) ,
                              axis : (x : 0.0 , y : 1.0 , z : 0.0))
        }
        .font(.system(size : 18.00 ,
                      weight : .semibold ,
                      design : .rounded))
        .foregroundColor(.white)
    }
}





struct ExplicitAnimations_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ExplicitAnimations().previewDevice("iPhone 12 Pro")
    }
}
