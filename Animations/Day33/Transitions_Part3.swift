//  Transitions_Part3.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/showing-and-hiding-views-with-transitions
 */

import SwiftUI



struct Transitions_Part3: View {
    
     // ///////////////////////
    // MARK: PROPERTY WRAPPERS
    
    @State private var isShowingRectangle: Bool = false
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            Button("Tap Me") {
                /**
                  When tapping the button ,
                  the rectangle scales up as the button makes space ,
                  then scales down when tapped again :
                  */
                withAnimation(Animation.default) {
                    isShowingRectangle.toggle()
                }
            }
            
            
            if isShowingRectangle {
                
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width : 200 ,
                           height : 200 * 0.618 ,
                           alignment : .center)
                    .foregroundColor(Color.orange)
                    .transition(.scale)
            }
        }
    }
}





struct Transitions_Part3_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Transitions_Part3().previewDevice("iPhone 12 Pro")
    }
}
