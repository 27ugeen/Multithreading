import UIKit

class Counter {
    var count: Int = 0
}

final class OwnThread: Thread {
    
    private var counter: Counter
    
    init(counter: Counter) {
        self.counter = counter
    }
    
    override func main() {
        for _ in 0..<100 {
            counter.count += 1
        }
        print(counter.count, Thread.isMainThread)
    }
}

let counter = Counter()
let ownThread = OwnThread(counter: counter)
//ownThread.qualityOfService = .background
print("thread executing state before start = \(ownThread.isExecuting)")
ownThread.start()
print("thread QOS = \(ownThread.qualityOfService.rawValue), isMAinThread: \(ownThread.isMainThread)")
print("thread executing state after start = \(ownThread.isExecuting)")

/***
 Процесс - некая работающая программа (например любое приложение целиком - Telegram/Slack/Viber - три процесса)
 Каждый процесс содержит инструкции - код, методы, выполнение step-by-step методов.
    Инструкции предоставляются процессору в формате Assambler.
 Поток это последовательность запрограммированых команд.
    Очень похож на процесс за исключением одного различия - ПОТОКИ использует ОДНО И ТО ЖЕ  адрессное пространство.
 Поток  это определенный способ выполнения какогото процесса (приложения).
 Потоки запущены внутри одного процесса (приложения) и выполняют определенные задачи.
 
 ***/

/***
Паралелелизм - это выполнение нескольких задач в один и тот же отрезок времени.
Паралелелизма на одноядерных системах НЕТ! Многопоточность ЕСТЬ!
На одном ядре идет смена контекста - переключение между потоками.
 Создается ИЛЛЮЗИЯ паралельного выполнения задач за счет мощности ядра процессора.
 Переключение контекста возможно между разными процессами (приложениями, хотя они и находятся в разных адрессных пространствах)
У потоков есть приоритеты - назначаются системой или вручную.
 Но они не являются единственным фактором - очередность выполнения задач выставляется зависисмостью.
***/
