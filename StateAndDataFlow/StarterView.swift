//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 01.11.2021.
// для сохранения в юзер дефолтс использовать appStorage

//представление, которое определяет стартовый экран приложения
import SwiftUI

struct StarterView: View {
    //@EnvironmentObject - объект окружения
    @EnvironmentObject private var user: UserManager
    @AppStorage("name") var userNameStorage = ""
    
    private func nameFromStorage() -> Bool {
        if userNameStorage != "" {
            user.name = userNameStorage
            user.isRegistered = true
        }
        return user.isRegistered
    }
    
    var body: some View {
        //позволяет сгруппировать логику свойств и вернуть во view
        Group {
            //если пользователь зарегистрирован, отображаем ContentView()
            if user.isRegistered {
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
