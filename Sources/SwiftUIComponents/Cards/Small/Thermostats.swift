//
//  Thermostats.swift
//  SwiftUIComponents
//
//  Created by Jiafu Zhang on 10/21/24.
//

import SwiftUI

public struct Thermostats<Contents: View>: View {
    @Binding private var isOn: Bool
    private var contents: Contents
    
    public var body: some View {
        VStack(spacing: 16) {
            contents
            DividerLine()
            toggle
        }
        .padding(20)
        .background(.linearGradient(colors: [
            .background(.primary).opacity(0.9),
            .background(.primary).opacity(0.9)
        ], startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .inset(by: 0.5)
                .stroke(.container(.border), lineWidth: 1)
        }
    }
    
    var toggle: some View {
        HStack {
            Text("ON")
                .font(.bodyMedium)
                .foregroundStyle(.foreground(.primary))
            Spacer()
            ToggleBlue(isOn: $isOn)
        }
    }
    
    public init(isOn: Binding<Bool>, @ViewBuilder contents: () -> Contents) {
        self._isOn = isOn
        self.contents = contents()
    }
}

struct ThermostatsView: View {
    @State private var isOn = true
    
    var body: some View {
        Thermostats(isOn: $isOn) {
            VStack(spacing: 16) {
                ButtonCircle(.extraLarge, state: .selected) {
                    Image(systemName: "thermometer")
                        .resizable()
                        .scaledToFit()
                        .padding(1)
                        .padding(.leading, 4)
                }
                VStack(spacing: 4) {
                    Text("Thermostats")
                        .font(.bodyMedium)
                        .foregroundStyle(.foreground(.primary))
                    Text("1 device")
                        .font(.bodyRegular)
                        .foregroundStyle(.foreground(.secondary))
                }
            }
        }
        .frame(width: 180)
    }
}

#Preview {
    ThermostatsView()
        .padding(60)
        .background(.background(.secondary))
        .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
        .preferredColorScheme(.light)
}
