//
//  TimeCounter.swift
//  StateAndDataFlow
//
//  Created by Artem Pavlov on 03.11.2021.
//

import Foundation
import Combine

//для работы таймера подписываем класс под протокол ObservableObject, для этого импортируем фреймворк Combine
class TimeCounter: ObservableObject {
    // благодаря свойству objectWillChange, мы можем следить за изменениями в классе
    // objectWillChange - это свойство "издатель", благодаря которому класс может уведомлять своих "подписчиков", т.е. те классы, которые имеют экземпляры класса-издателя
    // PassthroughSubject, TimeCounter - что должны возвращать, Never - будем ли обрабатывать ошибки, в нашем случае нет
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var counter = 3 //значение счетчика по умолчанию
    var timer: Timer? // объявляем класс таймер
    var buttonTitle = "Start" //название кнопки по умолчанию
    
    //метод запуска таймера
    func startTimer() {
        if counter > 0 { //если значение больше 0, то запускаем счетчик
            timer = Timer.scheduledTimer( //иницилизируем таймер
                timeInterval: 1, //интервал обновления в секундах
                target: self, //класс в котором используется метод
                selector: #selector(updateCounter), //метод, вызываемый в каждый интервал
                userInfo: nil,
                repeats: true //повторять или не повторять
            )
        }
        buttonDidTapped() //смена названия кнопки после запуска таймера
    }
    //метод, вызываемый в каждый интервал таймера
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer() //метод, останавливающий таймер
            buttonTitle = "Reset" //меняем название кнопки на Reset
        }
        objectWillChange.send(self) // отправляем обновленное состояние класса
    }
    
    private func killTimer() {
        timer?.invalidate() //останавливаем таймер
        timer = nil //выгружаем из памяти
    }
    
    // метод смены названия кнопки после запуска таймера
    private func buttonDidTapped() {
        //если название кнопки Reset, то мы устанавливаем значение счетчика на 3 и меняем название кнопки на Start
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..." //иначе название кнопки Wait
        }
        objectWillChange.send(self) //отправляем обновленное состояние класса
    }
}
