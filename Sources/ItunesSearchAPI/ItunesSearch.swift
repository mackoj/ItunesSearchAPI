// ItunesSearch.swift

import Foundation

// MARK: - ItunesSearch
public struct ItunesSearch: Equatable, Codable {
    public let resultCount: Int?
    public let results: [ItunesSearchResult]?
}

// Result.swift

import Foundation

// MARK: - Result
public struct ItunesSearchResult: Equatable, Codable {
    public let isGameCenterEnabled: Bool?
    public let screenshotUrls: [String]?
    public let ipadScreenshotUrls: [String]?
    public let appletvScreenshotUrls: [String]?
    public let artworkUrl60: String?
    public let artworkUrl512: String?
    public let artworkUrl100: String?
    public let artistViewUrl: String?
    public let supportedDevices: [String]?
    public let advisories: [String]?
    public let kind: String?
    public let features: [String]?
    public let trackCensoredName: String?
    public let languageCodesISO2A: [String]?
    public let fileSizeBytes: String?
    public let sellerUrl: String?
    public let contentAdvisoryRating: String?
    public let averageUserRatingForCurrentVersion: Double?
    public let userRatingCountForCurrentVersion: Int?
    public let trackViewUrl: String?
    public let trackContentRating: String?
    public let trackId: Int?
    public let trackName: String?
    public let releaseDate: String?
    public let currentVersionReleaseDate: String?
    public let releaseNotes: String?
    public let isVppDeviceBasedLicensingEnabled: Bool?
    public let primaryGenreName: String?
    public let genreIds: [String]?
    public let formattedPrice: String?
    public let minimumOsVersion: String?
    public let primaryGenreId: Int?
    public let sellerName: String?
    public let currency: String?
    public let version: String?
    public let wrapperType: String?
    public let artistId: Int?
    public let artistName: String?
    public let genres: [String]?
    public let price: Int?
    public let resultDescription: String?
    public let bundleId: String?
    public let averageUserRating: Double?
    public let userRatingCount: Int?
}
