// MARK: ImplicitAnimations.swift
/**
 SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/creating-implicit-animations
 
 The point is that
 nowhere have we said what each frame of the animation should look like ,
 and we haven’t even said when SwiftUI should start and finish the animation .
 Instead , our animation becomes a function of our state
 just like the views themselves .
 */

import SwiftUI



struct ImplicitAnimations: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    /** `STEP 1` :
     Because we want to change the scale effect value
     every time the button is tapped ,
     we need to use an `@State` property :
     */
    @State private var animationAmount: CGFloat = 1.00
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        Button("\(Image(systemName: "hand.tap"))") {
            /** `STEP 3`:
             Finally , when the button is tapped
             we want to increase the animation amount by 1 :
             */
            animationAmount += 1
        }
        .font(.largeTitle)
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        /** `STEP 2`:
         We can make the button use that for its scale effect ,
         by adding this modifier :
         */
        .scaleEffect(animationAmount)
        .blur(radius : (animationAmount - 1) * 3)
        /** `STEP 4`:
         We can ask SwiftUI to create an implicit animation for our changes
         so that all the scaling happens smoothly
         by adding an `animation()` modifier to the button :
         */
        .animation(.default)
    }
}





struct ImplicitAnimations_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ImplicitAnimations().previewDevice("iPhone 12 Pro")
    }
}
