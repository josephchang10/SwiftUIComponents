//
//  CodeBlock.swift
//  SwiftUIComponents
//
//  Created by Jiafu Zhang on 7/12/24.
//

import SwiftUI
import WebKit

public struct CodeBlock<Header: View>: View {
    private let code: String
    private let header: Header
    private let language: String?
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            BrowserButtons()
            header
            SyntaxHighlighter(code, language: language)
        }
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.container(.background))
                .fill(.ultraThinMaterial)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
//                .inset(by: 0.5)
                .strokeBorder(.container(.border), lineWidth: 1)
        }
        .frame(minWidth: 320)
        .shadowBlur(.extraLarge)
    }
    
    public init(_ code: String, language: String? = nil, @ViewBuilder header: () -> Header) {
        self.code = code
        self.language = language
        self.header = header()
    }
}

public struct SyntaxHighlighter: View {
    @State private var dynamicHeight: CGFloat = 0
    
    private let code: String
    private let language: String?
    
    public var body: some View {
        SyntaxHighlighterWebView(code: code, dynamicHeight: $dynamicHeight, language: language)
            .frame(height: dynamicHeight + 26)
    }
    
    public init(_ code: String, language: String? = nil) {
        self.code = code
        self.language = language
    }
}

#if canImport(AppKit)
typealias ViewRepresentable = NSViewRepresentable
#else
typealias ViewRepresentable = UIViewRepresentable
#endif

struct SyntaxHighlighterWebView: ViewRepresentable {
    let code: String
    @Binding var dynamicHeight: CGFloat
    let language: String?
    
    private var html: String {
        """
        <!DOCTYPE html>
        <html>
        <head>
            <link rel="stylesheet" media="(prefers-color-scheme: light), (prefers-color-scheme: no-preference)" href="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.10.0/build/styles/panda-syntax-light.min.css">
            <link rel="stylesheet" media="(prefers-color-scheme: dark)" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.1/styles/night-owl.min.css">
            <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono&display=swap" rel="stylesheet">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.1/highlight.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/highlightjs-line-numbers.js/2.8.0/highlightjs-line-numbers.min.js"></script>
            <script>
                hljs.highlightAll();
        
                hljs.initLineNumbersOnLoad();
            </script>
            <style>
                body {
                    margin: 10px 4px;
                }
        
                code {
                    white-space: pre-wrap;
                }
        
                .hljs {
                    background: none;
                    font-size: 12px;
                    font-family: 'Roboto Mono', monospace;
                    line-height: 18px;
                }
        
                pre code.hljs {
                    padding: 0;
                }
        
                /* for block of numbers */
                .hljs-ln-numbers {
                    opacity: 0.5;
                    text-align: right;
                }
        
                td.hljs-ln-code {
                    padding-left: 16px;
                }
        
                .hljs-comment, .hljs-keyword, .hljs-title {
                    font-style: normal;
                }
            </style>
        </head>
        <body>
            <pre><code\(language.map { " class=\"language-\($0))\"" } ?? "")>\(code.replacingOccurrences(of: "<", with: "&lt;"))</code></pre>
        """
    }
    
    #if canImport(AppKit)
    func makeNSView(context: Context) -> WKWebView {
        makeWebView(context: context)
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        nsView.loadHTMLString(html, baseURL: nil)
    }
    #else
    func makeUIView(context: Context) -> WKWebView {
        makeWebView(context: context)
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(html, baseURL: nil)
    }
    #endif
    
    func makeWebView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.isInspectable = true
        
        // Make the background transparent
        webView.setValue(false, forKey: "drawsBackground")
        
        return webView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: SyntaxHighlighterWebView
        
        init(_ parent: SyntaxHighlighterWebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.body.scrollHeight") { (result, _) in
                if let height = result as? CGFloat {
                    DispatchQueue.main.async {
                        self.parent.dynamicHeight = height
                    }
                }
            }
        }
    }
}

struct CodeBlockView: View {
    var body: some View {
        CodeBlock("""
        // Type or paste the code you want to highlight below
        ​
        import React, { useState } from 'react';

        function Counter() {
          const [count, setCount] = useState(0);

          return (
            <div>
              <p>You clicked {count} times</p>
              <button onClick={() => setCount(count + 1)}>
                Click me
              </button>
            </div>
          );
        }

        export default Counter;
        """) {
            Tab {
                TabButton("CSS")
                TabButton("React", state: .selected)
                TabButton("Tailwind")
            }
        }
        .frame(width: 360)
        .frame(minHeight: 356)
    }
}

#Preview {
    HStack(spacing: 20) {
        CodeBlockView()
            .environment(\.colorScheme, .light)
        CodeBlockView()
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .padding(60)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
    .preferredColorScheme(.light)
}
