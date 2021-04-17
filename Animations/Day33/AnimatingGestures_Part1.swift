//  AnimatingGestures_Part1.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/animating-gestures
 */

import SwiftUI



struct AnimatingGestures: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
//    @State private var dragAmount: CGSize = CGSize(width : 0.00 ,
//                                                   height : 0.00)
    @State private var dragAmount: CGSize = CGSize.zero
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            LinearGradient(gradient : Gradient(colors : [Color.orange , Color.red]) ,
                           startPoint : .leading ,
                           endPoint : .trailing)
                .clipShape(Circle())
                .frame(width : 150)
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged { (dragValue: DragGesture.Value) in
                            self.dragAmount = dragValue.translation
                        }
                        .onEnded { _ in
                            self.dragAmount = CGSize.zero
                        })
            /**
             You can now drag the gradient circle around ,
             and when you release the drag
             it will jump back to the center .
             The card has its `offset` determined by `dragAmount` ,
             which in turn is being set by the _drag gesture_ .
             */
            
            
            LinearGradient(gradient : Gradient(colors : [Color.purple , Color.pink]) ,
                           startPoint : .leading ,
                           endPoint : .trailing)
                .clipShape(Circle())
                .frame(width : 150)
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged { (dragValue: DragGesture.Value) in
                            self.dragAmount = dragValue.translation
                        }
                        .onEnded { _ in
                            self.dragAmount = CGSize.zero
                        })
                .animation(.spring())
            /**
             As you drag around ,
             the card will move to the drag location
             with a slight delay
             because of the spring animation ,
             but it will also gently overshoot
             if you make sudden movements .
             */
            
            
            LinearGradient(gradient : Gradient(colors : [Color.blue , Color.purple]) ,
                           startPoint : .leading ,
                           endPoint : .trailing)
                .clipShape(Circle())
                .frame(width : 150)
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged { (dragValue: DragGesture.Value) in
                            self.dragAmount = dragValue.translation
                        }
                        .onEnded { _ in
                            // withAnimation(.spring()) {
                            //    self.dragAmount = CGSize.zero
                            // }
                            withAnimation(
                                Animation
                                    .spring()) {
                                self.dragAmount = CGSize.zero
                            }
                        })
            /**
             Now the card will follow your drag immediately
             ( because that is not being animated ) ,
             but when you release
             it will animate .
             */
        }
    }
}





struct AnimatingGestures_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AnimatingGestures().previewDevice("iPhone 12 Pro")
    }
}
