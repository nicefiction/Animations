//  CustomizingAnimations_Part1.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/customizing-animations-in-swiftui
 
 When we attach the modifier `.animation(.default)` to a view ,
 SwiftUI will automatically animate any changes that happen to that view
 using whatever is the default system animation .
 In practice , that is an “ease in, ease out” animation ,
 which means iOS will start the animation slow ,
 make it pick up speed ,
 then slow down as it approaches its end .
 We can control the type of animation used
 by passing in different values to the modifier .
 */

import SwiftUI



struct CustomizingAnimations: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var animationAmount: CGFloat = 1.00
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            Button("\(Image(systemName: "hand.tap"))") {
                animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            // .blur(radius : (animationAmount - 1) * 2)
            .animation(.default)
            
            
            Button("\(Image(systemName: "hand.tap"))") {
                animationAmount += 1
            }
            .padding(40)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            // .blur(radius : (animationAmount - 1) * 2)
            /**
             Use `.easeOut` to make the animation start fast
             then slow down to a smooth stop :
             */
            .animation(.easeOut)
            
            
            Button("\(Image(systemName: "hand.tap"))") {
                animationAmount += 1
            }
            .padding(40)
            .background(Color.yellow)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            // .blur(radius : (animationAmount - 1) * 2)
            /**
             Spring animations cause the movement to overshoot
             then return to settle at its target .
             You can control the initial `stiffness` of the spring
             ( which sets its initial velocity when the animation starts ) ,
             and also how fast the animation should be _damped_
             – lower values cause the spring to bounce back and forth for longer .
             */
            .animation(.interpolatingSpring(stiffness : 50.00 ,
                                            damping : 1.00))
            
            Button("\(Image(systemName: "hand.tap"))") {
                animationAmount += 1
            }
            .padding(40)
            .background(Color.orange)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            // .blur(radius : (animationAmount - 1) * 2)
            /**
             For more precise control ,
             we can customize the animation with a duration
             specified as a number of seconds :
             */
            .animation(.easeInOut(duration : 2.00))
            
            
            Button("\(Image(systemName: "hand.tap"))") {
                animationAmount += 1
            }
            .padding(40)
            .background(Color.green)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            // .blur(radius : (animationAmount - 1) * 2)
            /**
             When we say `.easeInOut(duration : 2)`
             we are actually creating an instance of an `Animation` struct
             that has its own set of modifiers . So ,
             we can attach modifiers directly to the animation
             to add a delay like this :
             */
            .animation(
                Animation
                    .easeInOut(duration : 2.00)
                    .delay(1.00)
            )
            /**
             `NOTICE` that we explicitly have to say `Animation.easeInOut()` now ,
             because otherwise Swift isn’t quite sure what we mean :
             */
        }
        .font(.largeTitle)
    }
}





struct CustomizingAnimations_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CustomizingAnimations().previewDevice("iPhone 12 Pro")
    }
}
