//
//  CodeBlock.swift
//  SwiftUIComponents
//
//  Created by Jiafu Zhang on 7/12/24.
//

import SwiftUI
import WebKit

public struct CodeBlock<Header: View>: View {
    @State private var dynamicHeight: CGFloat = 0
    
    private let code: String
    private let header: Header
    private let language: String?
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            BrowserButtons()
            header
            SyntaxHighlighter(code: code, dynamicHeight: $dynamicHeight, language: language)
                .frame(height: dynamicHeight + 26)
        }
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.container(.background))
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

#if canImport(AppKit)
typealias ViewRepresentable = NSViewRepresentable
#else
typealias ViewRepresentable = UIViewRepresentable
#endif

struct SyntaxHighlighter: ViewRepresentable {
    let code: String
    @Binding var dynamicHeight: CGFloat
    let language: String?
    
    private var html: String {
        """
        <!DOCTYPE html>
        <html>
        <head>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.1/styles/default.min.css">
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
        
                .hljs-keyword, .hljs-title {
                    font-weight: normal;
                }
        
                @media (prefers-color-scheme: light) {
                    .hljs-comment {
                        color: rgba(0, 0, 0, 0.5);
                    }
        
                    .hljs-ln-code, .hljs-variable {
                        color: #000;
                    }
        
                    .hljs-keyword {
                        color: #B546BE;
                    }
        
                    .hljs-string {
                        color: #4A2BB2;
                    }
        
                    .hljs-variable + .hljs-title {
                        color: #614EA2;
                    }
        
                    .hljs-keyword + .hljs-title {
                        color: #000;
                    }  
        
                    .hljs-params, .hljs-keyword + .hljs-title:has(+ .hljs-params) {
                        color: #176E94;
                    } 
        
                    .hljs-ln-numbers {
                        color: rgba(0, 0, 0, 0.7);
                    }
                }
        
                @media (prefers-color-scheme: dark) {
                    .hljs-comment {
                        color: rgba(255, 255, 255, 0.7);
                    }
        
                    .hljs-ln-code {
                        color: #FFF;
                    }
        
                    .hljs-keyword {
                        color: #C792EA;
                    }
        
                    .hljs-string {
                        color: #ECC48D;
                    }
        
                    .hljs-variable, .hljs-keyword + .hljs-title {
                        color: #7DD8C7;
                    }
        
                    .hljs-variable + .hljs-title {
                        color: #ADDB67;
                    } 
        
                    .hljs-params, .hljs-keyword + .hljs-title:has(+ .hljs-params) {
                        color: #F9C789;
                    }
        
                    .hljs-ln-numbers {
                        color: rgba(255, 255, 255, 0.7);
                    }
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
        let parent: SyntaxHighlighter
        
        init(_ parent: SyntaxHighlighter) {
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
        function greet(name) {
          return `Hello, ${name}!`;
        }

        const message = greet("World");
        console.log(message);
        """) {
            Tab {
                TabButton("CSS", state: .selected)
                TabButton("React")
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
