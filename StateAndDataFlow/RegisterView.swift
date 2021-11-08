//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Artem Pavlov on 03.11.2021.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        VStack {
            UserNameTF(
                name: $userManager.user.name,
                nameIsValid: userManager.nameIsValid
            )
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!userManager.nameIsValid) //выключение кнопки в зависимости от валидности имени (nameIsValid)
        }
        .padding()
    }
}
    //метод регистрации пользователя
    extension RegisterView {
        func registerUser() {
            if !userManager.user.name.isEmpty { //если значение userManager пустое
                userManager.user.isRegistered.toggle() //то мы меняем значение свойства isRegistered на противоположное
                DataManager.shared.saveUser(user: userManager.user)//вызываем метод сохранения пользователя
            }
        }
    }

    struct UserNameTF: View {
        
        @Binding var name: String
        var nameIsValid = false
        
        var body: some View {
            ZStack {
                TextField("Type your name...", text: $name)
                    .multilineTextAlignment(.center)
                HStack {
                    Spacer()
                    Text("\(name.count)")
                        .font(.callout)
                        .foregroundColor(nameIsValid ? .green : .red) //в зависимости от значения nameIsValid, счетчик красится в зеленый или красный
                        .padding([.top, .trailing])
                }
                .padding(.bottom)
            }
        }
    }

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
