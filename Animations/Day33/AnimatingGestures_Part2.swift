//  AnimatingGestures_Part2.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/animating-gestures
 
 If we combine offset animations with drag gestures and a little delay ,
 we can create remarkably fun animations without a lot of code :
 */

import SwiftUI



struct AnimatingGestures_Part2: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var dragAmount: CGSize = CGSize.zero
    @State private var isEnabled: Bool = false
    
    
    
     // /////////////////
    //  MARK: PROPERTIES
    
    let helloWorld = Array("hello👋world🌍")
    
    
    
     // ///////////////////////////
    //  MARK: COMPUTED PROPPERTIES
    
    var body: some View {
        
        HStack(spacing : 0) {
            ForEach(0..<helloWorld.count) { (indexNumber: Int) in
                Text(String(helloWorld[indexNumber]))
                    .font(.headline)
                    .bold()
                    .foregroundColor(Color.white)
                    .padding(10)
                    .background(isEnabled ? Color.green : Color.blue)
                    .offset(dragAmount)
                    .animation(
                        Animation
                            .default
                            .delay(Double(indexNumber) / 20.00)
                    )
            }
            .gesture(
                DragGesture()
                    .onChanged {
                        self.dragAmount = $0.translation
                    }
                
                    .onEnded { _ in
                        self.dragAmount = CGSize.zero
                        isEnabled.toggle()
                    }
            )
            /**
             Any letter can be dragged around
             to have the whole string follow suit ,
             with a brief delay
             causing a snake-like effect .
             SwiftUI will also add in color changing as you release the drag ,
             animating between blue and red
             even as the letters move back to the center .
             */
        }
    }
}





struct AnimatingGestures_Part2_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AnimatingGestures_Part2().previewDevice("iPhone 12 Pro")
    }
}
