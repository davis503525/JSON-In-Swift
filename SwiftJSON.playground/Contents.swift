import UIKit

let url = NSBundle.mainBundle().URLForResource("Data", withExtension: "json")
let data = NSData(contentsOfURL: url!)

func readJSONObject(object: [String: AnyObject]) {
    guard let title = object["dataTitle"] as? String,
        let version = object["swiftVersion"] as? Float,
        let users = object["users"] as? [[String: AnyObject]] else { return }
    var combinedString = "Swift \(version) " + title
    
    for user in users {
        guard let name = user["name"] as? String,
            let age = user["age"] as? Int else { break }
        switch age {
        case 22:
            var nameAgeString = name + " is \(age) years old."
        case 25:
            var nameAgeString = name + " is \(age) years old."
        case 29:
            var nameAgeString = name + " is \(age) years old."
        default:
            break
        }
    }
}

do {
    let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
    if let dictionary = object as? [String: AnyObject] {
        readJSONObject(dictionary)
    }
} catch {
    // Handle Error
}

let validDictionary = [
    "numericalValue": 1,
    "stringValue": "JSON",
    "arrayValue": [0, 1, 2, 3, 4, 5]
]

let invalidDictionary = [
    "date": NSDate()
]

if NSJSONSerialization.isValidJSONObject(validDictionary) { // True
    do {
        let rawData = try NSJSONSerialization.dataWithJSONObject(validDictionary, options: .PrettyPrinted)
    } catch {
        // Handle Error
    }
}

if NSJSONSerialization.isValidJSONObject(invalidDictionary) { // False
    // NSJSONSerialization.dataWithJSONObject(validDictionary, options: .PrettyPrinted) will produce an error if called
}
