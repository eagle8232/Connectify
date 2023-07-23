//
//  DraggableDismissModifier.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 15.07.23.
//

import SwiftUI

struct DraggableDismissModifier: ViewModifier {
    @GestureState private var dragState = DragState.inactive
    @State private var positionOffset: CGFloat = 0.0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    private var threshold: CGFloat = 200

    func body(content: Content) -> some View {
        content
            .offset(y: self.positionOffset + self.dragState.translation.height)
            .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
            .gesture(
                LongPressGesture(minimumDuration: 0.01)
                    .sequenced(before: DragGesture())
                    .updating($dragState) { (value, state, transaction) in
                        switch value {
                        case .second(true, let drag):
                            state = .dragging(translation: drag?.translation ?? .zero)
                        default:
                            break
                        }
                    }
                    .onEnded { (value) in
                        guard case .second(true, let drag?) = value else {
                            return
                        }
                        if drag.translation.width.magnitude > self.threshold ||
                            drag.translation.height.magnitude > self.threshold {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
            )
            .onAppear {
                self.positionOffset = 0.0
            }
    }
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)

    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }

    var isActive: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}
