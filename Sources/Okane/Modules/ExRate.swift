import Foundation

public class ExRate: ExchangeRate {
    var base: Currency
    
    var target: Currency
    
    var date: Date
    
    var exchange_rate: Float?
    
    var exchange_rates: Dictionary<String, Double>?
    
    var api_response: Dictionary<String, Any>?
    
    init(base: Currency, target: Currency, date: Date) {
        self.base = base
        self.target = target
        self.date = date
    }
    
    func update_currency(base of: Currency, target to: Currency) {
        self.base = of
        self.target = to
    }
    
    func set_rates() {
        let strdate: String = ISO8601DateFormatter.string(from: self.date, timeZone: TimeZone.current, formatOptions: .withFullDate)
        
        // https://fixer.io/documentation
        let semaphore = DispatchSemaphore (value: 0)

        let url = "https://api.apilayer.com/fixer/\(strdate)?symbols=&base=\(self.base)"
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue(ExchangeRateApiKey, forHTTPHeaderField: "apikey")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else {
                print(String(describing: error))
                return
            }
            logger.info("\(String(data: data, encoding: .utf8)!)")
            guard let response = dataToDictionary(data: data) else { return }
            logger.info("json: \(String(describing: response))")
            self.api_response = response
            logger.info("response: \(String(describing: self.api_response))")
            self.exchange_rates = response["rates"] as? Dictionary<String, Double>
            logger.info("after call: \(String(describing: self.exchange_rates))")
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
    
    func set_rate() {
        guard let response = self.api_response else {
            logger.info("no responses from api yet")
            return
        }
        let rates = response["rates"] as! Dictionary<String, Double>
        logger.info("rates: \(String(describing: rates))")
        self.exchange_rate = NSNumber(value: rates["\(self.target)"]!).floatValue
        logger.info("exchange rates: \(String(describing: self.exchange_rates))")
        logger.info("exchange rate: \(String(describing: self.exchange_rate))")
    }
}
