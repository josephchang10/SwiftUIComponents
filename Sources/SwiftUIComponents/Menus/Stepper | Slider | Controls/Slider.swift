//
//  Slider.swift
//
//
//  Created by Jiafu Zhang on 6/8/24.
//

import SwiftUI

public struct SliderView<Content: View, V: BinaryFloatingPoint>: View where V.Stride : BinaryFloatingPoint {
    private let content: Content
    private let labelText: String?
    @Binding private var value: V
    private let bounds: ClosedRange<V>
    private let step: V?
    
    public var body: some View {
        VStack(spacing: 10) {
            content
            ProgressBar(value: $value, in: bounds, step: step, labelText: labelText)
                .frame(height: 12)
        }
        .padding(.vertical, 12)
    }
    
    public init(value: Binding<V>, in bounds: ClosedRange<V> = 0...1, step: V? = nil, label: String? = nil, @ViewBuilder content: () -> Content) {
        _value = value
        self.bounds = bounds
        self.step = step
        labelText = label
        self.content = content()
    }
}

public struct ProgressBar<V: BinaryFloatingPoint>: View where V.Stride : BinaryFloatingPoint {
    @Binding private var value: V
    private let bounds: ClosedRange<V>
    private let step: V?
    private let labelText: String?
    private let isConstant: Bool
    
    @State private var lastCoordinateValue: CGFloat = 0
    
    private var percentageValue: CGFloat {
        CGFloat((value - bounds.lowerBound) / (bounds.upperBound - bounds.lowerBound))
    }
    
    public var body: some View {
        GeometryReader { gr in
            let thumbSize: CGFloat = 18
            let radius: CGFloat = 3
            let minValue = gr.size.width * 0.015
            let maxValue = (gr.size.width * 0.98) - thumbSize
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.button(.inactive))
                    .frame(height: 12)
                RoundedRectangle(cornerRadius: 20)
//                    .inset(by: 0.25)
                    .stroke(.container(.borderSecondary), lineWidth: 0.5)
                    .frame(height: 12)
                RoundedRectangle(cornerRadius: radius)
                    .fill(LinearGradient(colors: [.init(red: 76 / 255, green: 137 / 255, blue: 1)], startPoint: .top, endPoint: .bottom))
                    .frame(height: 6)
                    .padding(.horizontal, 3)
                    .overlay(alignment: .leading) {
                        if !isConstant {
                            Circle()
                                .fill(LinearGradient(colors: [.init(red: 76 / 255, green: 137 / 255, blue: 1), .init(red: 55 / 255, green: 106 / 255, blue: 205 / 255)], startPoint: .init(x: 0.1, y: 0.1), endPoint: .init(x: 1.1, y: 1.1)))
                                .overlay {
                                    Circle()
                                        .inset(by: 0.25)
                                        .stroke(LinearGradient(colors: [.white.opacity(0.1), .black.opacity(0.3)], startPoint: .init(x: 0.1, y: 0.1), endPoint: .init(x: 1.1, y: 1.1)), lineWidth: 0.5)
                                }
                                .frame(width: thumbSize, height: thumbSize)
                                .overlay(alignment: .bottom) {
                                    label
                                        .fixedSize()
                                        .offset(y: -30)
                                }
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
                        }
                    }
            }
        }
    }
    
    var label: some View {
        Group {
            if let labelText {
                Text(labelText)
                    .font(.smallMedium)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    .background {
                        GeometryReader { proxy in
                            Capsule()
                                .fill(Color(red: 76 / 255, green: 137 / 255, blue: 1))
                        }
                    }
                    .overlay {
                        GeometryReader { proxy in
                            Triangle()
                                .fill(Color(red: 76 / 255, green: 137 / 255, blue: 1))
                                .frame(width: proxy.size.width / 4, height: 10)
                                .rotationEffect(.degrees(180))
                                .offset(y: 8)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        }
                    }
            } else {
                EmptyView()
            }
        }
    }
    
    public init(value: Binding<V>, in bounds: ClosedRange<V>, step: V? = nil, labelText: String? = nil) {
        _value = value
        self.bounds = bounds
        self.step = step
        self.labelText = labelText
        self.isConstant = false
    }
    
    public init(value: V, in bounds: ClosedRange<V>) {
        _value = .constant(value)
        self.bounds = bounds
        self.step = nil
        self.labelText = nil
        self.isConstant = true
    }
}

struct SliderPreview: View {
    @State private var value = 3000.0
    
    var body: some View {
        SliderView(value: $value, in: 0...6000, label: "CA$ \(Int(value))") {
            HStack {
                Text("Up to CA$6000")
                Spacer()
                Button("Clear") {
                    value = 3000
                }
                .buttonStyle(.plain)
            }
            .font(.captionMedium)
            .foregroundStyle(.foreground(.primary))
        }
        .frame(width: 320)
    }
}

#Preview {
    SliderPreview()
        .padding(60)
}
