import Foundation

public class Cash: Money {
    
    var account: Account
    
    var account_title: AccountTitle
    
    var currency: Currency
    
    var element: Element
    
    var is_fixed: Bool
    
    var value: Float
    
    init(account: Account, account_title: AccountTitle, currency: Currency, element: Element, is_fixed: Bool, value: Float) {
        self.account = account
        self.account_title = account_title
        self.currency = currency
        self.element = element
        self.is_fixed = is_fixed
        self.value = value
    }
    
    /// Calculate sum of the Cash values.
    static func sum(of instances: [Money]) -> Float {  // TODO: Allow multi-currency calculation
        return instances.reduce(0) { $0 + $1.value }
    }

    /// Convert value to target currency of a rate on given date.
    func convert(in currency: Currency, on date: Date) -> Float {
        if currency == self.currency {
            return self.value
        }else{
            // TODO: do exchange rate conversion
            // let e = ExchangeRate()
            // e.set_date()
            // e.set_currencies(of: Currency, to: Currency)
            // e.get_rate()
            // let converted = self.value * e
            // return converted
            return self.value
        }
    }
}
