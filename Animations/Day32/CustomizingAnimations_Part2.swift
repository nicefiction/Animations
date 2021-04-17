//  CustomizingAnimations_Part2.swift

import SwiftUI



struct CustomizingAnimations_Part2: View {
    
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
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .animation(
                Animation
                    .easeInOut(duration : 2.00)
                    .repeatCount(3 ,
                                 autoreverses : true)
            )
            /**
             `NOTE`: If we had set repeat count to `2`
             then the button would scale up
             then down again ,
             then jump immediately back up to its larger scale .
             This is because
             ultimately
             the button must match the state of our program ,
             regardless of what animations we apply
             – when the animation finishes
             the button must have whatever value is set in `animationAmount` .
             */
            
            
            Button("\(Image(systemName: "hand.tap"))") {
                animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            /**
             For continuous animations ,
             there is a `repeatForever()` modifier
             that can be used like this :
             */
            .animation(
                Animation
                    .easeInOut(duration : 2.00)
                    .repeatForever()
            )
            /**
             `NOTE`: We can use these `repeatForever()` animations
             in combination with `onAppear()`
             to make animations that start immediately
             and continue animating
             for the life of the view .
             
             To demonstrate this ,
             we are going to remove the animation from the button itself
             and instead apply it an overlay
             to make a sort of pulsating circle around the button :
             */
            
            Button("\(Image(systemName: "hand.tap"))") {
                // animationAmount += 1
            }
            .padding(40)
            .background(Color.yellow)
            .foregroundColor(.white)
            .clipShape(Circle())
            // .scaleEffect(animationAmount)
            .overlay(
                Circle()
                    .strokeBorder(Color.orange)
                    .scaleEffect(animationAmount)
                    // .opacity(Double(2 - animationAmount))
                    .animation(
                        Animation
                            .easeInOut(duration : 1.00)
                            .repeatForever(autoreverses : false)
                    )
            )
            .onAppear {
                self.animationAmount = 2
            }
        }
        .font(.largeTitle)
    }
}





struct CustomizingAnimations_Part2_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CustomizingAnimations_Part2().previewDevice("iPhone 12 Pro")
    }
}
