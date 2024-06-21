//
//  Alert.swift
//
//
//  Created by Jiafu Zhang on 6/21/24.
//

import SwiftUI

struct AlertView<Message: View, Actions: View>: View {
    @Binding var isPresented: Bool
    
    private let actions: Actions
    private let message: Message?
    private let messageKey: LocalizedStringKey?
    private let titleKey: LocalizedStringKey
    
    var body: some View {
        content
            .padding(10)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.container(.background))
                    .fill(.ultraThinMaterial)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .inset(by: 0.5)
                    .strokeBorder(.container(.border), lineWidth: 1)
            }
            .shadowBlurStrong(.extraLarge)
            .overlay(alignment: .topTrailing) {
                Button {
                    isPresented = false
                } label: {
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "xmark")
                    }
                }
                .buttonStyle(.plain)
                .padding(10)
            }
            .frame(minWidth: 220)
    }
    
    var content: some View {
        VStack(spacing: 10) {
            Text(titleKey)
                .font(.heading5)
                .foregroundStyle(.foreground(.primary))
            DividerLine()
            message
            if let messageKey {
                Text(messageKey)
                    .multilineTextAlignment(.center)
                    .font(.footnoteRegular)
                    .foregroundStyle(.foreground(.secondary))
            }
            DividerLine()
            actions
        }
        .padding(10)
    }
    
    init(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, messageKey: LocalizedStringKey?, @ViewBuilder message: () -> Message, @ViewBuilder actions: () -> Actions) {
        self.titleKey = titleKey
        _isPresented = isPresented
        self.messageKey = messageKey
        self.message = message()
        self.actions = actions()
    }
}

struct AlertViewModifier<Actions: View, Message: View>: ViewModifier {
    @Binding var isPresented: Bool
    let title: LocalizedStringKey
    let messageKey: LocalizedStringKey?
    let message: Message?
    var width: CGFloat = 300
    let actions: Actions
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                if let messageKey {
                    AlertView(title, isPresented: $isPresented, messageKey: messageKey, message: { message },  actions: { actions })
                        .frame(width: width)
                        .transition(.scale.combined(with: .opacity))
                }
            }
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0), value: isPresented)
    }
    
    init(isPresented: Binding<Bool>, title: LocalizedStringKey, message: LocalizedStringKey, width: CGFloat, @ViewBuilder actions: () -> Actions) where Message == EmptyView {
        self._isPresented = isPresented
        self.title = title
        self.messageKey = message
        self.width = width
        self.actions = actions()
        self.message = nil
    }
    
    init(isPresented: Binding<Bool>, title: LocalizedStringKey, width: CGFloat, @ViewBuilder message: () -> Message, @ViewBuilder actions: () -> Actions) {
        self._isPresented = isPresented
        self.title = title
        self.message = message()
        self.actions = actions()
        self.messageKey = nil
    }
}

public extension View {
    func alert<Content: View>(isPresented: Binding<Bool>, title: LocalizedStringKey, message: LocalizedStringKey, width: CGFloat = 300, @ViewBuilder actions: () -> Content) -> some View {
        modifier(AlertViewModifier(isPresented: isPresented, title: title, message: message, width: width, actions: actions))
    }
    
    func alert<Content: View>(isPresented: Binding<Bool>, title: LocalizedStringKey, width: CGFloat = 300, @ViewBuilder message: () -> Content, @ViewBuilder actions: () -> Content) -> some View {
        modifier(AlertViewModifier(isPresented: isPresented, title: title, width: width, message: message, actions: actions))
    }
}

struct AlertPreview: View {
    @State private var isPresented = true
    
    var body: some View {
        ZStack {
            Button("Show Alert") {
                isPresented = true
            }
        }
        .frame(width: 330, height: 229)
        .alert(isPresented: $isPresented, title: "Alert", message: "Are you sure you want to change your profile information? This cannot be undone.") {
            HStack(spacing: 10) {
                Button {
                    isPresented = false
                } label: {
                    ButtonPrimary(.small, title: "Cancel")
                }
                .buttonStyle(.plain)
                ButtonPrimary(.small, title: "Yes, go ahead")
            }
        }
    }
}

#Preview {
    HStack(spacing: 20) {
        AlertPreview()
            .environment(\.colorScheme, .light)
        AlertPreview()
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
