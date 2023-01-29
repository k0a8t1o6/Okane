import XCTest
@testable import Okane

final class CashTests: XCTestCase {
    func testSum() throws {
        // opening accounts
        let citi = Account(name: "Citi Bank", owner: "My", account_type: AccountType.Savings, country: Country.GB)
        let hsbc = Account(name: "HSBC Bank", owner: "Parter", account_type: AccountType.Checking, country: Country.AU)
        
        // Snapshot of Cash
        let citiCash = Cash(account: citi, account_title: AccountTitle.CASH_EQUIVALENT, currency: Currency.USD, element: Element.ASSETS, is_fixed: false, value: 1000)
        let hsbcCash = Cash(account: hsbc, account_title: AccountTitle.CASH_EQUIVALENT, currency: Currency.USD, element: Element.ASSETS, is_fixed: false, value: 500)
        
        // Run the function
        let cashPool: [Cash] = [citiCash, hsbcCash]
        let sum = Cash.sum(of: cashPool)
        XCTAssertEqual(sum, 1500)
    }
}
