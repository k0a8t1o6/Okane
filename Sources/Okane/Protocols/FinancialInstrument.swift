import Foundation

protocol FinancialInstrument {
    var average_cost: Float { get }
    var name: String { get }
    var date: Date { get }
    var price: Float { get }
    var unit: Unit { get }
//    var Transaction: Transaction { get }
    var volume: Float { get }
    
    func get_value() -> Float
    func set_avarage_cost() -> Float
    func calculate_profit() -> Float
    func get_diff_ratio() -> Float
}
