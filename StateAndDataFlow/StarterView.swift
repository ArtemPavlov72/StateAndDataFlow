//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Artem Pavlov on 03.11.2021.
// для сохранения в юзер дефолтс использовать appStorage

//представление, которое определяет стартовый экран приложения
import SwiftUI

struct StarterView: View {
    
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        Group {
            if userManager.user.isRegistered {
                TimerView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
