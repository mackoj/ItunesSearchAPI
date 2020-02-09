import XCTest
import NIO
import NIOHTTP1
import AsyncHTTPClient
@testable import ItunesSearchAPIClient

final class ItunesSearchAPIClientTests: XCTestCase {
  var httpClient : HTTPClient = {
    return HTTPClient(eventLoopGroupProvider: .createNew)
  }()
  
  func testExample() {
    do {
      try httpClient.getProductVersion(itcAppID: "284910350", { result in
        switch result {
        case .success(let search):
          print(search)
          let trackID : Int! = search.results?.first?.trackId
          XCTAssertEqual(trackID, 284910350)
        case .failure(let err):
          print(err)
        }
      })
    } catch {
      print(error)
    }
  }
  
  static var allTests = [
    ("testExample", testExample),
  ]
}
