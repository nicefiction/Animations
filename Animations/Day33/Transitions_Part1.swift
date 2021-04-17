//  Transitions.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/showing-and-hiding-views-with-transitions
 */

import SwiftUI



struct Transitions: View {
    
     // ///////////////////////
    // MARK: PROPERTY WRAPPERS
    
    @State private var isShowingRectangle: Bool = false
    
    
    
    // /////////////////////////
   // MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            Button("Tap Me") {
                /**
                  Pressing the button shows and hides the red square .
                  There’s no animation ;
                  it just appears and disappears abruptly .
                  */
                isShowingRectangle.toggle()
            }
            
            
            if isShowingRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width : 200 ,
                           height : 200 * 0.618 ,
                           alignment : .center)
                    .foregroundColor(.blue)
            }
        }
    }
}





struct Transitions_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Transitions().previewDevice("iPhone 12 Pro")
    }
}
