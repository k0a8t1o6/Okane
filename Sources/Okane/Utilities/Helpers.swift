import Foundation
import Logging

let logger = Logger(label: "com.atelierpal.Okane.main")

func dataToDictionary(data: Data) ->Dictionary<String, Any>?{
    do{
        let json = try JSONSerialization.jsonObject(with: data) as! Dictionary<String, AnyObject>
        return json
    }catch _ {
        logger.warning("Thrown")
        return nil
    }
}
