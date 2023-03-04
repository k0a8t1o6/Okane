import Foundation

protocol ExchangeRate {
    var base: Currency { get }
    var target: Currency { get }
    var date: Date { get set }
    var exchange_rate: Float? { get }
    
    func update_currency(base: Currency, target: Currency)
    func set_rates()
    func set_rate()
}
