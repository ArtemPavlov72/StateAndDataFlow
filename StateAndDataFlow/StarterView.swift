//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Artem Pavlov on 03.11.2021.
// для сохранения в юзер дефолтс использовать appStorage

//представление, которое определяет стартовый экран приложения
import SwiftUI

struct StarterView: View {
    //@EnvironmentObject - объект окружения
    @EnvironmentObject private var user: UserManager
    @AppStorage("name") var userNameStorage = ""
    @AppStorage("isRegistered") var registrationStorage = false
    
    private func nameFromStorage() -> Bool {
        if registrationStorage {
            user.name = userNameStorage
        }
        return registrationStorage
    }
    
    var body: some View {
        //позволяет сгруппировать логику свойств и вернуть во view
        Group {
            //если пользователь зарегистрирован, отображаем ContentView()
            if nameFromStorage() {
                ContentView()
                //если пользователь не зарегистрирован, отображаем RegisterView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
        //для возможности отображения вызываем модификатор .environmentObject
            .environmentObject(UserManager())
    }
}
