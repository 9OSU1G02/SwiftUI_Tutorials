//
//  RegisterView.swift
//  Kuchi
//
//  Created by 9OSU1G02 on 10/15/23.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var userManager: UserManager
    @FocusState var nameFieldFocus: Bool
    var body: some View {
        VStack {
            Spacer()
            WelcomeMessageView()
            TextField("Type your name...", text: $userManager.profile.name)
                .submitLabel(.done)
                .focused($nameFieldFocus)
                .bordered()
                .submitLabel(.done)
            HStack {
                Spacer()
                Text("\(userManager.profile.name.count)")
                    .font(.caption)
                    .foregroundStyle(userManager.isUserNameValid() ? .green : .red)
                    .padding(.trailing)
            }
            .padding(.bottom)
            HStack {
                Spacer()
                Toggle(isOn: $userManager.settings.rememberUser, label: {
                    Text("Remember me")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                })
                .fixedSize()
            }
            Button(action: registerUser, label: {
                HStack {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 16, height: 16, alignment: .center)
                    Text("OK")
                        .font(.body)
                        .bold()
                }
            })
            .disabled(!userManager.isUserNameValid())
            .bordered()
            Spacer()
        }
        .padding()
        .background {
            WelcomeBackgroundImage()
        }
    }
}

extension RegisterView {
    func registerUser() {
        nameFieldFocus = false
        if userManager.settings.rememberUser {
            userManager.persistProfile()
        } else {
            userManager.clear()
        }

        userManager.persistSettings()
        userManager.setRegistered()
    }
}

#Preview {
    let user = UserManager(name: "Huy")
    return RegisterView()
        .environmentObject(user)
}
