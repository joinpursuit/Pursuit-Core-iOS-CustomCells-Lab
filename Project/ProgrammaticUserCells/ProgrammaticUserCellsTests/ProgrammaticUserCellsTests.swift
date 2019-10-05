import XCTest
@testable import ProgrammaticUserCells

class ProgrammaticUserCellsTests: XCTestCase {

    func testGetUsers() {
        // Arrange
        let userData = getJSONDataFromBundle(withFileName: "randomUserSampleResponse")
        
        // Act
        let users = User.getUsers(from: userData)
        
        // Assert
        XCTAssertEqual(users.count, 50)
    }
    func getJSONDataFromBundle(withFileName filename: String) -> Data {
        guard let pathToData = Bundle.main.path(forResource: filename, ofType: "json") else {
            fatalError("\(filename).json file not found")
        }
        let internalUrl = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: internalUrl)
            return data
        }
        catch {
            fatalError("An error occurred: \(error)")
        }
    }
}
