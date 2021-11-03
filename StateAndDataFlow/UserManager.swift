//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Artem Pavlov on 03.11.2021.
//

//логика регистрации нового пользователя
//выносим в отдельный класс, это сервисный слой
//так как это синглтон, то здесь не надо объявлять приватные свойства или делать свойства shared

import Combine

//классы, которые не должны наследоваться надо помечать свойством final - это оптимизирует процесс
//здесь мы следим за одним свойством, а не за всем классом. Поэтому отмечаем данное свойство при помощи @Published
final class UserManager: ObservableObject {
    @Published var isRegistered = false
    var name = ""
    
}
