public class Account {
    let name: String
    let owner: String
    let account_type: AccountType
    let country: Country
    
    init(name: String, owner: String, account_type: AccountType, country: Country) {
        self.name = name
        self.owner = owner
        self.account_type = account_type
        self.country = country
    }
}
