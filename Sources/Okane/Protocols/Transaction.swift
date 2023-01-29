import Foundation

protocol Transaction {
    var identifier: String { get }
    var currency: Currency { get }
    var date: Date { get }
    var price: Float { get }
    var volume: Float { get }
    
    func get_cost() -> Float
}
