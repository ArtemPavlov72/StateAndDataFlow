//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Artem Pavlov on 03.11.2021.
//

//логика регистрации нового пользователя
//выносим в отдельный класс, это сервисный слой
//этот класс управляем данными, не сохранением данных

import Combine

final class UserManager: ObservableObject {
    
    @Published var user = User() //создаем публичное свойство user
    
    //если в имени больше либо три буквы, то такое имя валидно
    var nameIsValid: Bool {
        user.name.count >= 3
    }
    
    init() {}
    
    //инициализируем экземпляр модели
    init(user: User) {
        self.user = user
    }
}

//значения по умолчанию
struct User: Codable {
    var name = ""
    var isRegistered = false
}
