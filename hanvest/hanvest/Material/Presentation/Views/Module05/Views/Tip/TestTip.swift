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
    
    static let eventCount = Event(id: "eventCount")
    
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
        case .first: return [#Rule(Self.eventCount) { event in
            event.donations.count == 0 }]
        case .second: return [#Rule(Self.eventCount) { event in
            event.donations.count == 1 }]
        case .third: return [#Rule(Self.eventCount) { event in
            event.donations.count == 2 }]
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

struct PopoverTip1: Tip {

    var title: Text {
        Text("Test title 1").foregroundStyle(.indigo)
    }
    var rules: [Rule] {
        #Rule(TestView.tipDidOpen) {
            $0.donations.count == 0
        }
    }
    var message: Text? {
        Text("Test message 1")
    }
}

struct PopoverTip2: Tip {
    static let id: Int = 2
    var title: Text {
        Text("Test title 2").foregroundStyle(.indigo)
    }
    var rules: [Rule] {
        #Rule(TestView.tipDidOpen) {
            $0.donations.count == 1 //Odd
        }
    }

    var message: Text? {
        Text("Test message 2")
    }
}

struct TestView: View {
    static let tipDidOpen = Tips.Event(id: "tipDidOpen")
//    @State private var timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
//            TipView(PopoverTip1())
//               .tipViewStyle(TipWithoutDismissViewStyle())
//               .interactiveDismissDisabled(false)
            Text("Tip 1")
                .popoverTip(PopoverTip1())
                .interactiveDismissDisabled(false)
                .onTapGesture {
                    // Explicitly invalidate the tip when tapped
//                    PopoverTip1().invalidate(reason: .actionPerformed)

                    // After invalidating, send an event to update rules for other tips
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        TestView.tipDidOpen.sendDonation()
                    }
                }
//
            Text("Tip 2")
                .popoverTip(PopoverTip2())
                .onTapGesture {
                    // Explicitly invalidate the tip when tapped
                    PopoverTip2().invalidate(reason: .actionPerformed)

                    // After invalidating, send an event to update rules for other tips
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        TestView.tipDidOpen.sendDonation()
                    }
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

enum FeedTip: String, Tip {
    case welcome
    case add
    case remove
    
    var id: String {
        rawValue
    }
    
    var title: Text {
        switch self {
        case .welcome:
            Text("Welcome")
        case .add:
            Text("Add")
        case .remove:
            Text("Remove")
        }
    }
}

struct FeedView: View {
    @State private var tips = TipGroup(.ordered) {
        [
            FeedTip.welcome,
            .add,
            .remove
        ]
    }
    
    var body: some View {
        NavigationStack {
            List {
                TipView(
                    tips.currentTip?.id == FeedTip.welcome.id ? tips.currentTip : nil
                )
                
                Text(verbatim: "Item")
                    .popoverTip(
                        tips.currentTip?.id == FeedTip.remove.id ? tips.currentTip : nil
                    )
            }
            .navigationTitle("Items")
            .toolbar {
                Button("Add") {
                    FeedTip.add.invalidate(reason: .actionPerformed)
                    // Add another item...
                }
                .popoverTip(
                    tips.currentTip?.id == FeedTip.add.id ? tips.currentTip : nil
                )
            }
        }
    }
}



#Preview {
    FeedView()
        .task {
            try? Tips.resetDatastore() // for debugging
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
}

