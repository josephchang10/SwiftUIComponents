//
//  ToggleBlue.swift
//  SwiftUIComponents
//
//  Created by Jiafu Zhang on 10/21/24.
//

import SwiftUI

public struct ToggleBlue: View {
    @Binding var isOn: Bool
    
    public var body: some View {
        HStack(spacing: 0) {
            thumb
                .padding(isOn ? .leading : .trailing, 28)
        }
        .padding(2)
        .background {
            LinearGradient(colors: [
                .init(red: 49 / 255, green: 58 / 255, blue: 91 / 255),
                .init(red: 33 / 255, green: 39 / 255, blue: 61 / 255),
            ], startPoint: .init(x: 0.2, y: 0.1), endPoint: .init(x: 0.8, y: 0.9))
            .opacity(0.5)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .inset(by: 0.5)
                .stroke(.linearGradient(colors: [
                    .init(red: 134.0 / 255, green: 113.0 / 255, blue: 236.0 / 255).opacity(0.64),
                    .black
                ], startPoint: .init(x: 0.2, y: 0.1), endPoint: .init(x: 0.8, y: 0.9)), lineWidth: 1)
                .opacity(0.2)
        }
        .cornerRadius(20)
        .animation(.easeInOut, value: isOn)
        .onTapGesture {
            isOn.toggle()
        }
    }
    
    var thumb: some View {
        Circle()
            .fill(
                isOn ?
                .linearGradient(colors: [
                    .init(red: 15.0 / 255, green: 85.0 / 255, blue: 232.0 / 255),
                    .init(red: 157.0 / 255, green: 223.0 / 255, blue: 243.0 / 255)
                ], startPoint: .init(x: -0.5, y: 0.5), endPoint: .init(x: 0.5, y: 1.5)) :
                .linearGradient(colors: [
                    .init(red: 49.0 / 255, green: 58.0 / 255, blue: 91.0 / 255),
                    .init(red: 33.0 / 255, green: 39.0 / 255, blue: 61.0 / 255)
                ], startPoint: .init(x: 0.2, y: 0.2), endPoint: .init(x: 0.8, y: 0.9))
            )
            .overlay {
                Circle()
                    .inset(by: 0.5)
                    .stroke(.white.opacity(isOn ? 0.5 : 0), lineWidth: 1)
                    .stroke(.linearGradient(colors: [
                        .init(red: 134.0 / 255, green: 113.0 / 255, blue: 236.0 / 255),
                        .black
                    ], startPoint: .init(x: 0.2, y: 0.2), endPoint: .init(x: 0.8, y: 0.9)).opacity(isOn ? 0 : 0.2), lineWidth: 1)
            }
            .shadow(color: .black.opacity(isOn ? 0 : 0.3), radius: 10, y: 4)
            .frame(width: 28)
    }
}

struct ToggleBlueView: View {
    @State private var isOn = true
    
    var body: some View {
        ToggleBlue(isOn: $isOn)
    }
}

#Preview {
    ToggleBlueView()
        .padding(60)
        .background(.background(.secondary))
        .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
        .preferredColorScheme(.light)
}
