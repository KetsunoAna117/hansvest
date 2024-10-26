//
//  TestTip.swift
//  hanvest
//
//  Created by Bryan Vernanda on 26/10/24.
//


import SwiftUI
import TipKit

enum TestTip: Tip {
    case first, second, third
    
    @Parameter
    static var showFirst: Bool = false
    @Parameter
    static var showSecond: Bool = false
    @Parameter
    static var showThird: Bool = false
    
    // Provide a unique ID for each tip
    var id: String {
        switch self {
        case .first: return "com.example.tip.first"
        case .second: return "com.example.tip.second"
        case .third: return "com.example.tip.third"
        }
    }
    
    var title: Text {
        switch self {
        case .first: return Text("First")
        case .second: return Text("Second")
        case .third: return Text("Third")
        }
    }
    
    var rules: [Rule] {
        switch self {
        case .first: return [#Rule(Self.$showFirst) { $0 == true }]
        case .second: return [#Rule(Self.$showSecond) { $0 == true }]
        case .third: return [#Rule(Self.$showThird) { $0 == true }]
        }
    }
    var shouldDisplay: Bool {
        switch self {
        case .first:
            return TestTip.showFirst
        case .second:
            return TestTip.showSecond
        case .third:
            return TestTip.showThird
        }
    }
}

struct TestView: View {
    var body: some View {
        VStack {
            Text("First tip")
                .popoverTip(TestTip.first)
                .onTapGesture {
                    TestTip.showSecond = true
                }
            Spacer()
            Text("Second tip")
                .popoverTip(TestTip.second)
                .onTapGesture {
                    TestTip.showThird = true
                }
            Spacer()
            Text("Third tip")
                .popoverTip(TestTip.third)
        }
        .onAppear(perform: {
            TestTip.showFirst = true
        })
    }
}

#Preview {
    TestView()
        .task {
            try? Tips.resetDatastore() // for debugging
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
}

