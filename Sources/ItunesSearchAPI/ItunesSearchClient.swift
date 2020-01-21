import Foundation

extension String : Error {}

public struct ItunesSearchClient {
  static var shared : ItunesSearchClient?
  
  static public func getAppInfo(_ id : String, _ completion : @escaping (Result<ItunesSearch, Error>)->Void) throws {
    if ItunesSearchClient.shared == nil {
      ItunesSearchClient.shared = ItunesSearchClient()
    }
    try shared?.getAppInfo(id, completion)
  }
  
  private mutating func getAppInfo(_ id : String, _ completion : @escaping (Result<ItunesSearch, Error>)->Void) throws {
    if id.isEmpty { throw("ID cannot be empty") }
    guard let url = URL(string: "https://itunes.apple.com/lookup?id=\(id)") else { throw("URL cannot be created") }
    let semaphore = DispatchSemaphore(value: 0)
    let dataTask = URLSession.shared.dataTask(
    with: url) { (data, response, error) in
      defer { semaphore.signal() }
      if error == nil, data?.isEmpty == false, let unwrappedData = data {
        do {
          let search = try JSONDecoder().decode(ItunesSearch.self, from: unwrappedData)
          completion(.success(search))
          return
        } catch {
          completion(.failure(error))
          return
        }
      }
      if let unwrappedError = error {
        completion(.failure(unwrappedError))
        return
      }
      completion(.failure("Unknowed error"))
    }
    dataTask.resume()
    _ = semaphore.wait(timeout: .distantFuture)
  }
}
