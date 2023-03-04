import XCTest
@testable import Okane

final class ExRateTests: XCTestCase {
    let yesterday: Date = Calendar.current.date(byAdding: .day, value: -1, to: Date())!

    func testSetRates() throws {
        let e = ExRate(base: Currency.USD, target: Currency.JPY, date: self.yesterday)
        e.set_rates()
        XCTAssertNotNil(e.exchange_rates)
    }
    
    func testSetRate() throws {
        let e = ExRate(base: Currency.USD, target: Currency.JPY, date: self.yesterday)
        print("rates: \(String(describing: e.exchange_rate))")
        XCTAssertNil(e.exchange_rate)
        XCTAssertTrue(e.set_rate() == ())  // Void without getting rates
        e.set_rates()
        e.set_rate()
        XCTAssertNotNil(e.exchange_rate)
    }
}
