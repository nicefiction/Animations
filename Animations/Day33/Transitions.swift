//  Transitions.swift

import SwiftUI



struct Transitions: View {
    
     // ///////////////////////
    // MARK: PROPERTY WRAPPERS
    
    @State private var isShowingCircle: Bool = false
    
    
    
    // /////////////////////////
   // MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            VStack {
                Button("Tap One") {
                   /**
                     Pressing the button shows and hides the red square .
                     There’s no animation ;
                     it just appears and disappears abruptly .
                     */
                    isShowingCircle.toggle()
                }
                
                
                if isShowingCircle {
                    
                    Circle()
                        .frame(width: 200)
                        .foregroundColor(Color.blue)
                }
            }
            VStack {
                Button("Tap Two") {
                   /**
                     With that small change ,
                     the app now fades the red rectangle in and out ,
                     while also moving the button up to make space :
                     */
                    withAnimation(Animation.default) {
                        isShowingCircle.toggle()
                    }
                }
                
                
                if isShowingCircle {
                    
                    Circle()
                        .frame(width: 200)
                        .foregroundColor(Color.red)
                }
            }
            VStack {
                Button("Tap Three") {
                   /**
                     When tapping the button ,
                     the rectangle scales up as the button makes space ,
                     then scales down when tapped again :
                     */
                    withAnimation(Animation.default) {
                        isShowingCircle.toggle()
                    }
                }
                
                
                if isShowingCircle {
                    
                    Circle()
                        .frame(width: 200)
                        .foregroundColor(Color.orange)
                        .transition(.scale)
                }
            } 
            VStack {
                Button("Tap Three") {
                   /**
                     There are a handful of other transitions you can try if you want to experiment .
                     A useful one is `.asymmetric` ,
                     which lets us use one transition when the view is being shown
                     and another when it is disappearing :
                     */
                    withAnimation(Animation.default) {
                        isShowingCircle.toggle()
                    }
                }
                
                
                if isShowingCircle {
                    
                    Circle()
                        .frame(width: 200)
                        .foregroundColor(Color.yellow)
                        .transition(.asymmetric(insertion : .scale ,
                                                removal : .opacity))
                }
            }
        }
    }
}





struct Transitions_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Transitions().previewDevice("iPhone 12 Pro")
    }
}
