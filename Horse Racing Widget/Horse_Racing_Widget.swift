//
//  Horse_Racing_Widget.swift
//  Horse Racing
//
//  Created on 10/08/2021.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), race: RacesDataFetcher().fetchRandomRace())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), race: RacesDataFetcher().fetchRandomRace())
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, race: RacesDataFetcher().fetchRandomRace())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let race: Race?
}

struct Horse_Racing_WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        RaceWidgetView(race: entry.race)
    }
}

@main
struct Horse_Racing_Widget: Widget {
    let kind: String = "Horse_Racing_Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind,
                            intent: ConfigurationIntent.self,
                            provider: Provider()) { entry in
            Horse_Racing_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Random Race")
        .description("Display an upcoming horse race which will be updated randomly.")
        .supportedFamilies([.systemSmall])
    }
}

struct Horse_Racing_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Horse_Racing_WidgetEntryView(entry: SimpleEntry(date: Date(), race: RacesDataFetcher().fetchRandomRace()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
