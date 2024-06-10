//
//  Stepper.swift
//
//
//  Created by Jiafu Zhang on 6/10/24.
//

import SwiftUI

public struct StepperView<V: Strideable>: View {
    private let value: Binding<V>
    
    public var body: some View {
        HStack(spacing: 10) {
            Button {
                value.wrappedValue = value.wrappedValue.advanced(by: 1)
            } label: {
                ZStack {
                    Circle()
                        .fill(.button(.normal))
                    Circle()
//                        .inset(by: 0.5)
                        .stroke(LinearGradient(colors: [.white.opacity(0.1), .black.opacity(0.3)], startPoint: .init(x: 0.1, y: 0.1), endPoint: .init(x: 0.9, y: 0.9)), lineWidth: 1)
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                        .font(.bodyMedium)
                }
                .frame(width: 24)
                .shadowBlur(.medium)
            }
            .buttonStyle(.plain)
            Text("\(value.wrappedValue)")
                .font(.bodyMedium)
                .foregroundStyle(.foreground(.primary))
                .inverseColorScheme()
                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
            Button {
                value.wrappedValue = value.wrappedValue.advanced(by: -1)
            } label: {
                ZStack {
                    Circle()
                        .fill(.container(.background))
                    Circle()
//                        .inset(by: 0.5)
                        .stroke(.container(.border), lineWidth: 1)
                    Image(systemName: "minus")
                        .foregroundStyle(.white)
                        .font(.bodyMedium)
                }
                .frame(width: 24)
                .inverseColorScheme()
                .shadowBlur(.medium)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 0.5)
        .padding(.vertical, 2.5)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.button(.inactive))
        }
    }
    
    public init(value: Binding<V>) {
        self.value = value
    }
}

struct StepperPreview: View {
    @State private var value = 1
    
    var body: some View {
        StepperView(value: $value)
    }
}

#Preview {
    StepperPreview()
        .padding(60)
//        .background(.container(.background))
        .background(Color(red: 53 / 255, green: 53 / 255, blue: 53 / 255))
        .preferredColorScheme(.dark)
}
