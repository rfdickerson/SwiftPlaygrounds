//: [Previous](@previous)
import Foundation

protocol WatsonResponse {
    associatedtype Answer
    
    var timestamp: Date { get set }
    var answer: Answer {get}
}

struct JokeResponse: WatsonResponse {
    
    typealias Answer = String
    
    var timestamp: Date = Date()
    
    var answer: String {
        return "Knock knock..."
    }

}


struct TemperatureResponse: WatsonResponse {
    
    typealias Answer = Double
    
    var timestamp: Date = Date()
    
    var answer: Double {
        return 99.0
    }
    
}

extension WatsonResponse {
    
    func printAnswer() -> Answer {
        return answer
    }
}

extension WatsonResponse where Answer == Double {
    
    func doubleStuff() -> Double {
        return answer * 2
    }
}


let a = TemperatureResponse()
a.printAnswer()
a.doubleStuff()

let b = JokeResponse()
b.printAnswer()
b.timestamp

//: [Next](@next)
