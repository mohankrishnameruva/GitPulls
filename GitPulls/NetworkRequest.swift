
import Foundation

struct NetworkRequest {
  enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
  }

  enum RequestError: Error {
    case invalidResponse
    case networkCreationError
    case otherError
    case sessionExpired
  }

  enum RequestType: Equatable {
    case codeExchange(code: String)
    case getRepos
		case getPrs(repo: String)
    case getUser
    case signIn

    func networkRequest() -> NetworkRequest? {
      guard let url = url() else {
        return nil
      }
      return NetworkRequest(method: httpMethod(), url: url)
    }

    private func httpMethod() -> NetworkRequest.HTTPMethod {
      switch self {
      case .codeExchange:
        return .post
      case .getRepos:
        return .get
      case .getUser:
        return .get
      case .signIn:
        return .get
			case .getPrs:
				return .get
      }
    }

    private func url() -> URL? {
      switch self {
      case .codeExchange(let code):
        let queryItems = [
          URLQueryItem(name: "client_id", value: NetworkRequest.clientID),
          URLQueryItem(name: "client_secret", value: NetworkRequest.clientSecret),
          URLQueryItem(name: "code", value: code)
        ]
        return urlComponents(host: "github.com", path: "/login/oauth/access_token", queryItems: queryItems).url
      case .getRepos:
        guard
          let username = NetworkRequest.username,
          !username.isEmpty
        else {
          return nil
        }
        return urlComponents(path: "/users/\(username)/repos", queryItems: nil).url
      case .getUser:
        return urlComponents(path: "/user", queryItems: nil).url
      case .signIn:
        let queryItems = [
          URLQueryItem(name: "client_id", value: NetworkRequest.clientID)
        ]

        return urlComponents(host: "github.com", path: "/login/oauth/authorize", queryItems: queryItems).url
      
			case .getPrs(let repo):
				guard
					let username = NetworkRequest.username,
					!username.isEmpty
				else {
					return nil
				}
				return urlComponents(path: "/repos/\(username)/\(repo)/pulls", queryItems: nil).url
			}
			
    }

    private func urlComponents(host: String = "api.github.com", path: String, queryItems: [URLQueryItem]?) -> URLComponents {
      switch self {
      default:
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        return urlComponents
      }
    }
  }

  typealias NetworkResult<T: Decodable> = (response: HTTPURLResponse, object: T)

  // MARK: Private Constants
  static let callbackURLScheme = "gitprs"
  static let clientID = "Iv1.4b51475386b2403e"
  static let clientSecret = "af6c88c7cd482f349aa4c072d5ac68ac459de90e"

  // MARK: Properties
  var method: HTTPMethod
  var url: URL

  // MARK: Static Methods
  static func signOut() {
    Self.accessToken = ""
    Self.refreshToken = ""
    Self.username = ""
  }

  // MARK: Methods
  func start<T: Decodable>(responseType: T.Type, completionHandler: @escaping ((Result<NetworkResult<T>, Error>) -> Void)) {
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    if let accessToken = NetworkRequest.accessToken {
      request.setValue("token \(accessToken)", forHTTPHeaderField: "Authorization")
    }
    let session = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let response = response as? HTTPURLResponse else {
        DispatchQueue.main.async {
          completionHandler(.failure(RequestError.invalidResponse))
        }
        return
      }
      guard
        error == nil,
        let data = data
      else {
        DispatchQueue.main.async {
          let error = error ?? NetworkRequest.RequestError.otherError
          completionHandler(.failure(error))
        }
        return
      }

      if T.self == String.self, let responseString = String(data: data, encoding: .utf8) {
        let components = responseString.components(separatedBy: "&")
        var dictionary: [String: String] = [:]
        for component in components {
          let itemComponents = component.components(separatedBy: "=")
          if let key = itemComponents.first, let value = itemComponents.last {
            dictionary[key] = value
          }
        }
        DispatchQueue.main.async {
          NetworkRequest.accessToken = dictionary["access_token"]
          NetworkRequest.refreshToken = dictionary["refresh_token"]
          completionHandler(.success((response, "Success" as! T)))
        }
        return
      } else if let object = try? JSONDecoder().decode(T.self, from: data) {
        DispatchQueue.main.async {
          if let user = object as? User {
            NetworkRequest.username = user.login
          }
          completionHandler(.success((response, object)))
        }
        return
      } else {
        DispatchQueue.main.async {
          completionHandler(.failure(NetworkRequest.RequestError.otherError))
        }
      }
    }
    session.resume()
  }
}
