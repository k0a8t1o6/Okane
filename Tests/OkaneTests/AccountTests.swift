import XCTest
@testable import Okane

final class AccountTests: XCTestCase {
    func testInstantiation() throws {
        let account1 = Account(name: "CitiBank", owner: "Me", account_type: AccountType.Checking, country: Country.AU)
        XCTAssertEqual(account1.country, Country.AU)
    }
}
