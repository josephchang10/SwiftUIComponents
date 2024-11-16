//
//  FiltersCard.swift
//
//
//  Created by Jiafu Zhang on 6/9/24.
//

import SwiftUI

public struct FiltersCard<Content: View>: View {
    private let content: Content
    
    public var body: some View {
        VStack(spacing: 0) {
            content
        }
        .padding(20)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.container(.background))
                .fill(.ultraThinMaterial)
        }
//        .shadowBlur(.extraLarge)
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

struct FiltersCardView: View {
    @State private var price = 4000.0
    @State private var carryOnBag = 1
    @State private var selectAllAirlines = false
    
    var body: some View {
        FiltersCard {
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                Text("Filters")
                    .font(.headlineMedium)
                    .width(.full, alignment: .leading)
                Text("Reset")
                    .font(.bodyMedium)
            }
            .foregroundStyle(.foreground(.primary))
            .padding(.horizontal, 12)
            .padding(.vertical, 24)
            Separator()
            HStack(spacing: 12) {
                Text("Sort by")
                    .width(.full, alignment: .leading)
                Image(systemName: "chevron.down")
            }
            .font(.bodyLargeMedium)
            .foregroundStyle(.foreground(.primary))
            .padding(12)
            Separator()
            VStack(spacing: 10) {
                Text("Stops")
                    .font(.bodyLargeMedium)
                    .foregroundStyle(.foreground(.primary))
                    .width(.full, alignment: .leading)
                VStack(spacing: 0) {
                    HStack(spacing: 10) {
                        ZStack {
                            Circle()
                                .fill(Color(red: 76 / 255, green: 137 / 255, blue: 1))
                                .frame(width: 10)
                            Circle()
                                .inset(by: 0.5)
                                .stroke(.foreground(.secondary), lineWidth: 1)
                        }
                        .frame(width: 16, height: 16)
                        .padding(4)
                        Text("Any number of stops")
                            .font(.bodyRegular)
                            .foregroundStyle(.foreground(.secondary))
                            .width(.full, alignment: .leading)
                    }
                    .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
                    HStack(spacing: 10) {
                        Circle()
                            .inset(by: 0.5)
                            .stroke(.foreground(.secondary), lineWidth: 1)
                            .frame(width: 16, height: 16)
                            .padding(4)
                        Text("Nonstop only")
                            .font(.bodyRegular)
                            .foregroundStyle(.foreground(.secondary))
                            .width(.full, alignment: .leading)
                    }
                    .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
                    HStack(spacing: 10) {
                        Circle()
                            .inset(by: 0.5)
                            .stroke(.foreground(.secondary), lineWidth: 1)
                            .frame(width: 16, height: 16)
                            .padding(4)
                        Text("1 stop or fewer")
                            .font(.bodyRegular)
                            .foregroundStyle(.foreground(.secondary))
                            .width(.full, alignment: .leading)
                    }
                    .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
                    HStack(spacing: 10) {
                        Circle()
                            .inset(by: 0.5)
                            .stroke(.foreground(.secondary), lineWidth: 1)
                            .frame(width: 16, height: 16)
                            .padding(4)
                        Text("2 stops or fewer")
                            .font(.bodyRegular)
                            .foregroundStyle(.foreground(.secondary))
                            .width(.full, alignment: .leading)
                    }
                    .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            Separator()
            VStack(spacing: 12) {
                Text("Price")
                    .font(.bodyLargeMedium)
                    .foregroundStyle(.foreground(.primary))
                    .width(.full, alignment: .leading)
                Slider2(value: $price, in: 0...6000, label: "CA$ \(Int(price))") {
                    HStack {
                        Text("Up to CA$6000")
                        Spacer()
                        Button("Clear") {
                            price = 4000
                        }
                        .buttonStyle(.plain)
                    }
                    .font(.captionMedium)
                    .foregroundStyle(.foreground(.primary))
                }
            }
            .padding(12)
            Separator()
            VStack(spacing: 12) {
                Text("Travel and baggage")
                    .font(.bodyLargeMedium)
                    .foregroundStyle(.foreground(.primary))
                    .width(.full, alignment: .leading)
                VStack(spacing: 0) {
                    HStack(spacing: 10) {
                        Circle()
                            .inset(by: 0.5)
                            .stroke(.foreground(.secondary), lineWidth: 1)
                            .frame(width: 16, height: 16)
                            .padding(4)
                        Text("Seat choice")
                            .font(.bodyRegular)
                            .foregroundStyle(.foreground(.secondary))
                            .width(.full, alignment: .leading)
                    }
                    .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
                    HStack(spacing: 10) {
                        Circle()
                            .inset(by: 0.5)
                            .stroke(.foreground(.secondary), lineWidth: 1)
                            .frame(width: 16, height: 16)
                            .padding(4)
                        Text("No cancel fee")
                            .font(.bodyRegular)
                            .foregroundStyle(.foreground(.secondary))
                            .width(.full, alignment: .leading)
                    }
                    .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
                    HStack(spacing: 10) {
                        Circle()
                            .inset(by: 0.5)
                            .stroke(.foreground(.secondary), lineWidth: 1)
                            .frame(width: 16, height: 16)
                            .padding(4)
                        Text("No change fee")
                            .font(.bodyRegular)
                            .foregroundStyle(.foreground(.secondary))
                            .width(.full, alignment: .leading)
                    }
                    .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
                    HStack(spacing: 10) {
                        Circle()
                            .inset(by: 0.5)
                            .stroke(.foreground(.secondary), lineWidth: 1)
                            .frame(width: 16, height: 16)
                            .padding(4)
                        Text("Carry-on bag")
                            .font(.bodyRegular)
                            .foregroundStyle(.foreground(.secondary))
                            .width(.full, alignment: .leading)
                        StepperView(value: $carryOnBag)
                    }
                    .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
                }
            }
            .padding(12)
            Separator()
            VStack(spacing: 12) {
                Text("Airlines")
                    .font(.bodyLargeMedium)
                    .foregroundStyle(.foreground(.primary))
                    .width(.full, alignment: .leading)
                HStack(spacing: 12) {
                    Text("Select all airlines")
                        .font(.bodyRegular)
                        .foregroundStyle(.foreground(.secondary))
                        .width(.full, alignment: .leading)
                    Switch(isOn: $selectAllAirlines)
                }
            }
            .padding(12)
        }
        .frame(width: 480)
    }
}

#Preview {
    FiltersCardView()
        .padding(60)
}
