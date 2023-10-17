//
//  SettingsView.swift
//  Kuchi
//
//  Created by 9OSU1G02 on 10/16/23.
//

import SwiftUI

struct SettingsView: View {
    @State var learningEnabled: Bool = true
    @AppStorage("dailyReminderEnabled")
    var dailyReminderEnabled = false
    @State var dailyReminderTime = Date(timeIntervalSince1970: 0)
    @State var cardBackgroundColor: Color = .red
    @AppStorage("appearance") var appearance: Appearance = .automatic
    @EnvironmentObject var challengesViewModel: ChallengesViewModel
    @AppStorage("dailyReminderTime")
    var dailyReminderTimeShadow: Double = 0
    var body: some View {
        List {
            Text("Settings")
                .font(.largeTitle)
                .padding(.bottom, 8)
            Section {
                VStack(alignment: .leading) {
                    Picker("", selection: $appearance) {
                        ForEach(Appearance.allCases) { apperance in
                            Text(apperance.name).tag(apperance)
                        }
                    }
                    .pickerStyle(.segmented)
                    ColorPicker("Card Background Color", selection: $cardBackgroundColor)
                }
            } header: {
                Text("Appearance")
            }
            Section {
                VStack(alignment: .leading, content: {
                    Stepper("Number of Questions: \(challengesViewModel.numberOfQuestions)", value: challengesViewModel.$numberOfQuestions, in: 3 ... 20)
                    Text("Any change will affect the next game")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                    Toggle("Learning Enabled", isOn: $learningEnabled)
                })
            } header: {
                Text("Game")
            }
            Section {
                HStack {
                    Toggle("Daily Reminder", isOn: $dailyReminderEnabled)
                        .onChange(of: dailyReminderEnabled, perform: { _ in
                            configureNotification()
                        })
                    DatePicker("",
                               selection: $dailyReminderTime,
                               displayedComponents: .hourAndMinute)
                        .disabled(!dailyReminderEnabled)
                        .onChange(of: dailyReminderTime, perform: { newValue in
                            dailyReminderTimeShadow = newValue.timeIntervalSince1970
                            configureNotification()
                        })
                        .onAppear(perform: {
                            dailyReminderTime = .init(timeIntervalSince1970: dailyReminderTimeShadow)
                        })
                }
            } header: {
                Text("Notifications")
            }
        }
    }

    func configureNotification() {
        if dailyReminderEnabled {
            // 1
            LocalNotifications.shared.createReminder(
                time: dailyReminderTime)
        } else {
            // 2
            LocalNotifications.shared.deleteReminder()
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(ChallengesViewModel())
}
