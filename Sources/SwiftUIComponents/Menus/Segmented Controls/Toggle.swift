//
//  Toggle.swift
//
//
//  Created by Jiafu Zhang on 4/7/24.
//

import SwiftUI

public struct Toggle<ButtonsContent: View>: View {
    @Environment(\.colorScheme) var colorScheme
    
    let isVertical: Bool
    let buttonsContent: ButtonsContent
    
    var buttons: some View {
        if isVertical {
            AnyView(VStack(spacing: 4) {
                buttonsContent
            })
        } else {
            AnyView(HStack(spacing: 4) {
                buttonsContent
            })
        }
    }
    
    public var body: some View {
        buttons
        .padding(4)
        .background {
            RoundedRectangle(cornerRadius: 99)
                .fill(.container(.background).opacity(colorScheme == .dark ? 0.8 : 1)) // Workaround to increase contrast in dark mode
                .stroke(.container(.border), lineWidth: 1)
        }
    }
    
    public init(isVertical: Bool = false, @ViewBuilder _ buttonsContent: () -> ButtonsContent) {
        self.isVertical = isVertical
        self.buttonsContent = buttonsContent()
    }
}

struct ToggleView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(spacing: 20) {
                Toggle {
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "moon")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "display")
                            .symbolRenderingMode(.monochrome)
                    }
                }
                Toggle {
                    ButtonCircle(.small) {
                        Image(systemName: "moon")
                    }
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "display")
                            .symbolRenderingMode(.monochrome)
                    }
                }
                Toggle {
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "moon")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "display")
                            .symbolRenderingMode(.monochrome)
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "sun.max")
                    }
                }
                Toggle {
                    ButtonCircle(.small) {
                        Image(systemName: "moon")
                    }
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "display")
                            .symbolRenderingMode(.monochrome)
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "sun.max")
                    }
                }
                Toggle {
                    ButtonCircle(.small) {
                        Image(systemName: "moon")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "display")
                            .symbolRenderingMode(.monochrome)
                    }
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "sun.max")
                    }
                }
            }
            HStack(spacing: 20) {
                Toggle {
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "moon")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "display")
                            .symbolRenderingMode(.monochrome)
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "sun.max")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "wand.and.rays.inverse")
                    }
                }
                Toggle {
                    ButtonCircle(.small) {
                        Image(systemName: "moon")
                    }
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "display")
                            .symbolRenderingMode(.monochrome)
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "sun.max")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "wand.and.rays.inverse")
                    }
                }
                Toggle {
                    ButtonCircle(.small) {
                        Image(systemName: "moon")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "display")
                            .symbolRenderingMode(.monochrome)
                    }
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "sun.max")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "wand.and.rays.inverse")
                    }
                }
            }
            HStack(spacing: 20) {
                Toggle {
                    ButtonCircle(.small) {
                        Image(systemName: "moon")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "display")
                            .symbolRenderingMode(.monochrome)
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "sun.max")
                    }
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "wand.and.rays.inverse")
                    }
                }
                Toggle {
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "moon")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "display")
                            .symbolRenderingMode(.monochrome)
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "sun.max")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "wand.and.rays.inverse")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "person")
                    }
                }
                Toggle {
                    ButtonCircle(.small) {
                        Image(systemName: "moon")
                    }
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "display")
                            .symbolRenderingMode(.monochrome)
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "sun.max")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "wand.and.rays.inverse")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "person")
                    }
                }
            }
            HStack(spacing: 20) {
                Toggle {
                    ButtonCircle(.small) {
                        Image(systemName: "moon")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "display")
                            .symbolRenderingMode(.monochrome)
                    }
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "sun.max")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "wand.and.rays.inverse")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "person")
                    }
                }
                Toggle {
                    ButtonCircle(.small) {
                        Image(systemName: "moon")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "display")
                            .symbolRenderingMode(.monochrome)
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "sun.max")
                    }
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "wand.and.rays.inverse")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "person")
                    }
                }
                Toggle {
                    ButtonCircle(.small) {
                        Image(systemName: "moon")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "display")
                            .symbolRenderingMode(.monochrome)
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "sun.max")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "wand.and.rays.inverse")
                    }
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "person")
                    }
                }
            }
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        ToggleView()
            .environment(\.colorScheme, .light)
        ToggleView()
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .background(Color(red: 53/255, green: 53/255, blue: 53/255))
}

#Preview {
    Toggle(isVertical: true) {
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "moon")
        }
        ButtonCircle(.small) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        }
    }
    .padding()
    .environment(\.colorScheme, .light)
}
