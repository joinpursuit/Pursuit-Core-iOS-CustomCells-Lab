import Foundation

class UsersFetchingService {

    // MARK: - Static Properties

    static let manager = UsersFetchingService()

    // MARK: - Internal Methods

    func getUsers(completionHandler: @escaping (Result<[User], AppError>) -> Void) {
        NetworkHelper.manager.performDataTask(withUrl: URL(string: usersEndpoint)!,
                                              andMethod: .get) { (result) in
            switch result {
            case let .success(data):
                let users = User.getUsers(from: data)
                completionHandler(.success(users))
            case let .failure(error):
                completionHandler(.failure(.other(rawError: error)))
            }
        }
    }

    // MARK: - Private Properties and Initializers

    private let usersEndpoint = "https://randomuser.me/api/?results=500"

    private init() {}
}
