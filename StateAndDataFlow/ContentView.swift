//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Artem Pavlov on 03.11.2021.
//

import SwiftUI

struct ContentView: View {
    //добавляем @StateObject - для того, чтобы экземпляр класса мог получать обновленные данные класса-издателя, получаем изменения родительского класса в реальном времени
    @StateObject private var timer = TimeCounter() //экземпляр класса таймер
    //для отображение пользователя на этой view добавляем свойство userManager
    @EnvironmentObject private var userManager: UserManager
    @AppStorage("name") var userNameStorage = ""
    @AppStorage("isRegistered") var registrationStorage = false
    
    private func logOutButtonPressed() {
        userNameStorage = ""
        userManager.isRegistered.toggle()
        registrationStorage = false
    }
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.name)") //отображаем имя пользователя
                .font(.largeTitle)
                .padding(.top, 100)
            Text("\(timer.counter)") //отображаем значение таймера
                .font(.largeTitle)
                .padding(.top, 200)
            Spacer()
            ButtonView(timer: timer)
            Spacer()
            LogOutButtonView {
                logOutButtonPressed()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

//кнопка
struct ButtonView: View {
    //  @ObservedObject - это как @binding, только для свойств @StateObject
    @ObservedObject var timer: TimeCounter //создаем экземпляр класса таймер
    
    var body: some View {
        Button(action: { timer.startTimer() }) {
            Text(timer.buttonTitle) //меняем название кнопки
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}
