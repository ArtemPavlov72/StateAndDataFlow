//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by iMac on 08.11.2021.
//
//делаем класс синглтон DataManager, модель данных
import SwiftUI

class DataManager {
    
    static let shared = DataManager()
    
    @AppStorage("user") private var userData: Data? //создаем модель по ключу User, типа Data. Изначально свойство не инициализировано, имеет значение nil
    
    private init() {}
    
    //метод сохранения юзера. Создаем из экземпляра объект с типом Data.
    func saveUser(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    //метод извлечения данных, и декодирования данных с типом Data
    func loadUser() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData ?? Data()) else { return User() }
        return user
    }
    
    //метод удаления данных юзера
    func clear(userManager: UserManager) {
        userManager.user.isRegistered = false //присваем свойству isRegistered - false
        userManager.user.name = "" //удаляем данных из userManager
        userData = nil //присваеваем экземпляру значение nil
    }
}
