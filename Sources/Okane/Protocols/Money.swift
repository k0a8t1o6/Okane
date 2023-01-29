protocol Money {
    var account: Account { get }
    var account_title: AccountTitle { get }
    var currency: Currency { get }
    var element: Element { get }
    var is_fixed: Bool { get }
    var value: Float { get }

    static func sum(of instances: [Money]) -> Float
}
