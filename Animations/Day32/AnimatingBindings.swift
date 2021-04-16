//  AnimatingBindings.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/animating-bindings
 
 The `animation()` modifier can be applied to any SwiftUI binding ,
 which causes the value to animate between its current and new value .
 This even works if the data in question isn’t really something that sounds like it can be animated ,
 such as a Boolean .
 These binding animations
 effectively turn the tables on implicit animations :
 rather than setting the animation on a view
 and implicitly animating it with a state change ,
 we now set nothing on the view
 and explicitly animate it with a state change .
 In the former ,
 the state change has no idea it will trigger an animation ,
 and in the latter
 the view has no idea it will be animated
 – both work and both are important .
 */

import SwiftUI



struct AnimatingBindings: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var animationAmount: CGFloat = 1.00
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        print("Animation amount value : \(animationAmount)")
        
        
        return VStack {
            /**
             The stepper can move `animationAmount` up and down ,
             and tapping the button will add 1 to it
             – they are both tied to the same data ,
             which in turn causes the size of the button to change :
             */
            Stepper("Animate with default values :" ,
                    value : $animationAmount.animation(.default) ,
                    in : 1...10)
            Stepper("Animate with repeat count :" ,
                    value: $animationAmount.animation(
                        Animation
                            .easeInOut(duration : 2.00)
                            .repeatCount(3 , autoreverses : true)
                    ) ,
                    in : 1...10)
            Spacer()
            Button("Tap Me") {
                self.animationAmount += 1
            }
            .font(.system(size : 18.00 ,
                          weight : .semibold ,
                          design : .rounded))
            .padding(40)
            .background(Color.orange)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            // .animation(.default)
        }
        .padding()
    }
}





struct AnimatingBindings_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AnimatingBindings().previewDevice("iPhone 12 Pro")
    }
}
