//  Transitions_Part4.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/showing-and-hiding-views-with-transitions
 */

import SwiftUI



struct Transitions_Part4: View {
    
     // ///////////////////////
    // MARK: PROPERTY WRAPPERS
    
    @State private var isShowingRectangle: Bool = false
   
   
   
     // /////////////////////////
    // MARK: COMPUTED PROPERTIES
   
    var body: some View {
        
        VStack {
            Button("Tap Me") {
                /**
                  There are a handful of other transitions you can try if you want to experiment .
                  A useful one is `.asymmetric` ,
                  which lets us use one transition when the view is being shown
                  and another when it is disappearing :
                  */
                withAnimation(Animation.default) {
                    isShowingRectangle.toggle()
                }
            }
            
            
            if isShowingRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width : 200 ,
                           height : 200 * 0.618 ,
                           alignment : .center)
                    .foregroundColor(.pink)
                    .transition(.asymmetric(insertion : .scale ,
                                            removal : .opacity))
            }
        }
    }
}





struct Transitions_Part4_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Transitions_Part4().previewDevice("iPhone 12 Pro")
    }
}
