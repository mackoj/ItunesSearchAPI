import Foundation
import NIO
import NIOHTTP1
import AsyncHTTPClient
import ItunesSearchAPI

extension String : Error {}

extension AsyncHTTPClient.HTTPClient {
  public func getProductVersionRequest(itcAppID : String) throws -> HTTPClient.Request {
    if itcAppID.isEmpty { throw("ID cannot be empty") }
    guard let url = URL(string: "https://itunes.apple.com/lookup?id=\(itcAppID)") else { throw("URL cannot be created") }
    
    return try HTTPClient.Request(
      url: url,
      method: .GET,
      headers: [
        "Accept": "application/json",
      ],
      body: nil)
  }
  
  private func convertFromByteBuffer<T : Codable>(type : T.Type) -> ((_ response : HTTPClient.Response) -> Result<T, Error>) {
    return { response in
      guard let byteBuffer = response.body else { return .failure("byteBuffer is bad") }
      do {
        let obj = try JSONDecoder().decode(T.self, from: byteBuffer)
        return .success(obj)
      } catch {
        if let errorString = byteBuffer.getString(at: 0, length: byteBuffer.capacity, encoding: .utf8) {
          print(errorString)
        }
        return .failure(error)
      }
    }
  }
  
  public func getProductVersion(itcAppID : String, _ completion : @escaping (Result<ItunesSearch, Error>) -> Void) throws {
    let futureRequest = try getProductVersionRequest(itcAppID: itcAppID)
    self.execute(request: futureRequest) // EventLoopFuture<HTTPClient.Response>
      .flatMapResult(convertFromByteBuffer(type: ItunesSearch.self))
      .whenComplete(completion)
  }
}
