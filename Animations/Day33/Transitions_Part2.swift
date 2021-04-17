//  Transitions_Part2.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/showing-and-hiding-views-with-transitions
 */

import SwiftUI



struct Transitions_Part2: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var isShowingRectangle: Bool = false
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            Button("Tap Me") {
                /**
                  With that small change ,
                  the app now fades the red rectangle in and out ,
                  while also moving the button up to make space :
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
                    .foregroundColor(Color.red)
            }
        }
    }
}





struct Transitions_Part2_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Transitions_Part2().previewDevice("iPhone 12 Pro")
    }
}
