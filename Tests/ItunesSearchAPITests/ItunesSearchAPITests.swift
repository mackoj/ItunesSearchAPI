import XCTest
@testable import ItunesSearchAPI

final class ItunesSearchAPITests: XCTestCase {
  func testExample() {
    do {
      try ItunesSearchClient.getAppInfo("284910350") { (res) in
        switch res {
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
    ("testExample", testExample),
  ]
}
