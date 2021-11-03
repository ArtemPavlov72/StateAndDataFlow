//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Artem Pavlov on 03.11.2021.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    
    
    //@AppStorage
    //определяем источник данных, который определяет пользователя
    //используем @StateObject
    //сразу инициализируем
    
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            //меняем на наш StarterView() экран
            StarterView()
            //чтобы положить в окружение, вызываем модификатор .environmentObject
                .environmentObject(userManager)
        }
    }
}
