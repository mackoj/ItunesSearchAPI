import XCTest
import NIO
import NIOHTTP1
import AsyncHTTPClient
@testable import ItunesSearchAPIClient

final class ItunesSearchAPIClientTests: XCTestCase {
  
  func testGetProductVersion() {
    do {
      let client = HTTPClient(eventLoopGroupProvider: .createNew)
      try API.getProductVersion(httpClient: client, itcAppID: "284910350") { result in
        switch result {
        case .success(let search):
          print(search)
          let trackID : Int! = search.results?.first?.trackId
          XCTAssertEqual(trackID, 284910350)
        case .failure(let err):
          print(err)
        }
      }
    } catch {
      print(error)
    }
  }
  
  static var allTests = [
    ("testGetProductVersion", testGetProductVersion),
  ]
}
