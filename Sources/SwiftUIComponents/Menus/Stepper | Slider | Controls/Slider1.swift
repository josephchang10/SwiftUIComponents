//
//  SwiftUIView.swift
//  SwiftUIComponents
//
//  Created by Jiafu Zhang on 11/16/24.
//

import SwiftUI

public struct Slider1<Content: View, V: BinaryFloatingPoint>: View where V.Stride : BinaryFloatingPoint {
    private let content: Content
    @Binding private var value: V
    private let bounds: ClosedRange<V>
    private let step: V?
    
    @State private var lastCoordinateValue: CGFloat = 0
    
    private var percentageValue: CGFloat {
        CGFloat((value - bounds.lowerBound) / (bounds.upperBound - bounds.lowerBound))
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            GeometryReader { gr in
                let thumbSize: CGFloat = 20
                let minValue: CGFloat = 0
                let maxValue = gr.size.width - thumbSize
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3)
                        .fill(.container(.divider))
                        .frame(height: 4)
                        .overlay(alignment: .leading) {
                            Circle()
                                .fill(.background(.primary))
                                .overlay {
                                    Circle()
                                        .inset(by: 0.5)
                                        .stroke(.container(.divider), lineWidth: 1)
                                }
                                .frame(width: thumbSize, height: thumbSize)
                                .offset(x: percentageValue * (maxValue - minValue) + minValue)
                                .gesture (
                                    DragGesture(minimumDistance: 0)
                                        .onChanged { v in
                                            if (abs(v.translation.width) < 0.1) {
                                                self.lastCoordinateValue = (maxValue - minValue) * percentageValue + minValue
                                            }
                                            let translation = v.translation.width
                                            let newValue = V((translation + lastCoordinateValue - minValue) / (maxValue - minValue)) * (bounds.upperBound - bounds.lowerBound) + bounds.lowerBound
                                            if let step {
                                                value = round(newValue / step) * step
                                            } else {
                                                value = newValue
                                            }
                                            value = min(Swift.max(value, bounds.lowerBound), bounds.upperBound)
                                        }
                                )
                                .shadow(color: .black.opacity(0.1 / 4), radius: 10, y: 10)
                                .shadow(color: .black.opacity(0.5 / 4), radius: 10, y: 10)
                        }
                }
            }
            .frame(height: 4)
            content
        }
    }
    
    public init(value: Binding<V>, in bounds: ClosedRange<V> = 0...1, step: V? = nil, @ViewBuilder content: () -> Content) {
        _value = value
        self.bounds = bounds
        self.step = step
        self.content = content()
    }
}

fileprivate struct SliderView: View {
    @State private var value = 0.12
    
    var body: some View {
        Slider1(value: $value) {
            HStack {
                Text("2:10")
                Spacer()
                Text("4:21")
            }
            .font(.smallRegular)
            .foregroundStyle(.foreground(.secondary))
            .padding(.vertical, 4)
        }
        .frame(width: 280)
    }
}

#Preview {
    SliderView()
        .padding(60)
}
