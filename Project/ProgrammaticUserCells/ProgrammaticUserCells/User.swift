import Foundation

struct ResultsWrapper: Codable {
    let results: [User]
}

struct User: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let dob: BirthdayInfo
    let phone: String
    let cell: String
    let picture: UserImageInfo
    
    static func getUsers(from jsonData: Data) -> [User] {
        do {
            let resultsWrapper = try JSONDecoder().decode(ResultsWrapper.self, from: jsonData)
            return resultsWrapper.results
        } catch {
            print(error)
            return []
        }
    }
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String
}

struct Location: Codable {
    let street: Street
    let city: String
    let state: String
    let postcode: String
    
    enum CodingKeys: String, CodingKey {
        case street, city, state, postcode
    }
    
    //https://stackoverflow.com/questions/47935705/using-codable-with-key-that-is-sometimes-an-int-and-other-times-a-string
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        street = try container.decode(Street.self, forKey: .street)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        if let postCodeInt = try? container.decode(Int.self, forKey: .postcode) {
            postcode = String(postCodeInt)
        } else {
            postcode = try container.decode(String.self, forKey: .postcode)
        }
    }
}

struct Street: Codable {
    let number: Int
    let name: String
}

struct BirthdayInfo: Codable {
    let date: String
    let age: Int
}

struct UserImageInfo: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}
