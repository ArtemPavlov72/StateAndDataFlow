//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Artem Pavlov on 03.11.2021.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var userName = ""
    //@EnvironmentObject - как @ObservedObject, или как @Binding. Только @EnvironmentObject создает источник данных, доступный из любого представления проекта. Можно передавать не по цепочке, а через представление, или через несколько представлений. Обращаемся к данным из того места, где они нам понадобятся.
    //Если нам нужны данные пользователя в структуреRegisterView, мы обращаемся в этой структуре к этим данным через @EnvironmentObject
    @EnvironmentObject private var user: UserManager
    @AppStorage("name") var userNameStorage = ""
    
    var body: some View {
        VStack {
            //текстовое поле, где будем вводить имя пользователя
            HStack {
                TextField("Enter your name...", text: $userName) //передаем значение userName
                    .multilineTextAlignment(.center)// отображаем по центру
                if userName.count < 3 { //УБРАТЬ В МЕТОД!!!
                    Text("\(userName.count)")
                        .foregroundColor(.red)
                } else {
                    Text("\(userName.count)")
                        .foregroundColor(.green)
                }
        }
        //Кнопка с картинкой
        Button(action: registerUser) {
            HStack {
                if userName.count < 3 { //УБРАТЬ В МЕТОД!!!
                    Image(systemName: "checkmark.circle").opacity(0.5)
                    Text("OK").opacity(0.5)
                } else {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
        }
    }
        .padding()
}

//метод регистрации пользователя
private func registerUser() {
    if !userName.isEmpty && userName.count > 2 { //если поле пользователя не пустое
        user.name = userName //передаем данные пользователя в свойство name экземпляра user
        user.isRegistered.toggle() //меняем свойство регистрации на противоположное
        userNameStorage = userName
    }
}
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
