//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Artem Pavlov on 03.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
            
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            
            Spacer()
            
            VStack {
                Spacer()
                
                ButtonView(title: timer.buttonTitle, color: .red) {
                    timer.startTimer() //передаем значения в первую кнопку
                }
                
                Spacer()

                //вторая кнопка:
                ButtonView(title: "LogOut", color: .blue) {
                    DataManager.shared.clear(userManager: userManager)
                }
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

