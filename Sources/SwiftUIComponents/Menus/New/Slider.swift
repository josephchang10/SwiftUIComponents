//
//  Slider.swift
//
//
//  Created by Jiafu Zhang on 6/8/24.
//

import SwiftUI

public struct SliderView<Content: View, Value: BinaryFloatingPoint>: View where Value.Stride : BinaryFloatingPoint {
    private let content: Content
    private let labelText: String?
    @Binding private var value: Value
    
    public var body: some View {
        VStack(spacing: 10) {
            content
            ProgressBar(value: $value, labelText: labelText)
                .frame(height: 12)
        }
        .padding(.vertical, 10)
    }
    
    public init(value: Binding<Value>, label: String? = nil, @ViewBuilder content: () -> Content) {
        _value = value
        labelText = label
        self.content = content()
    }
}

struct ProgressBar<Value: BinaryFloatingPoint>: View where Value.Stride : BinaryFloatingPoint {
    @Binding var value: Value
    let labelText: String?
    
    @State private var labelSize: CGSize = .zero
    @State private var lastCoordinateValue: CGFloat = 0
    
    var body: some View {
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
                        Circle()
                            .fill(LinearGradient(colors: [.init(red: 76 / 255, green: 137 / 255, blue: 1), .init(red: 55 / 255, green: 106 / 255, blue: 205 / 255)], startPoint: .init(x: 0.1, y: 0.1), endPoint: .init(x: 1.1, y: 1.1)))
                            .overlay {
                                Circle()
                                    .inset(by: 0.25)
                                    .stroke(LinearGradient(colors: [.white.opacity(0.1), .black.opacity(0.3)], startPoint: .init(x: 0.1, y: 0.1), endPoint: .init(x: 1.1, y: 1.1)), lineWidth: 0.5)
                            }
                            .frame(width: thumbSize, height: thumbSize)
                            .offset(x: CGFloat(value) * (maxValue - minValue) + minValue)
                            .gesture (
                                DragGesture(minimumDistance: 0)
                                    .onChanged { v in
                                        if (abs(v.translation.width) < 0.1) {
                                            self.lastCoordinateValue = (maxValue - minValue) * CGFloat(value) + minValue
                                        }
                                        if v.translation.width > 0 {
                                            value = Value((min(maxValue, lastCoordinateValue + v.translation.width) - minValue) / (maxValue - minValue))
                                        } else {
                                            value = Value((Swift.max(minValue, lastCoordinateValue + v.translation.width) - minValue) / (maxValue - minValue))
                                        }
                                        
                                    }
                            )
                    }
                    .overlay(alignment: .bottomLeading) {
                        label
                            .offset(y: -23)
                            .offset(x: CGFloat(value) * (maxValue - minValue) + minValue - labelSize.width / 2 + thumbSize / 2)
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
                    .padding(.vertical, 6)
                    .background {
                        GeometryReader { proxy in
                            Capsule()
                                .fill(Color(red: 76 / 255, green: 137 / 255, blue: 1))
                                .onAppear { labelSize = proxy.size }
                        }
                    }
                    .overlay(alignment: .bottom) {
                        Triangle()
                            .fill(Color(red: 76 / 255, green: 137 / 255, blue: 1))
                            .frame(width: labelSize.width / 4, height: 10)
                            .rotationEffect(.degrees(180))
                            .offset(y: 8)
                    }
            } else {
                EmptyView()
            }
        }
    }
}

struct SliderPreview: View {
    @State private var value = 0.5
    
    var body: some View {
        SliderView(value: $value, label: "CA$ \(Int(value * 6000))") {
            HStack {
                Text("Up to CA$6000")
                Spacer()
                Button("Clear") {
                    value = 0.5
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
//        .background(.container(.background))
        .background(Color(red: 53 / 255, green: 53 / 255, blue: 53 / 255))
}
