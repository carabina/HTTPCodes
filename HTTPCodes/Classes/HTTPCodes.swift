//
//  HTTPCodes.swift
//  HTTPCodes
//
//  Created by Jakub Olejník on 03/10/2016.
//
//

import Foundation

enum Code {
    case information(Int)
    case success(Success)
    case redirect(Int)
    case clientError(ClientError)
    case serverError(ServerError)
    case unknown(Int)
    
    var code: Int {
        switch self {
        case .information(let code):
            return code
        case .success(let success):
            return success.rawValue
        case .redirect(let code):
            return code
        case .clientError(let error):
            return error.rawValue
        case .serverError(let error):
            return error.rawValue
        case .unknown(let code):
            return code
        }
    }
    
    init(code: Int) {
        switch code {
        case 100..<200:
            self = .information(code)
        case 200..<300:
            self = .success(Success(rawValue: code) ?? .unknown)
        case 300..<400:
            self = .redirect(code)
        case 400..<500:
            self = .clientError(ClientError(rawValue: code) ?? .unknown)
        case 500..<600:
            self = .serverError(ServerError(rawValue: code) ?? .unknown)
        default:
            self = .unknown(code)
        }
    }
}

enum Success: Int {
    case success = 200
    case created = 201
    case accepted = 202
    case nonAuthoritativeInformation = 203
    case noContent = 204
    case resetContent = 205
    case partialContent = 206
    case multiStatus = 207
    case alreadyReported = 208
    case imUsed = 226
    case unknown = -1
}

enum ClientError: Int, Error {
    case badRequest = 400
    case unauthorized = 401
    case paymentRequired = 402
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case notAcceptable = 406
    case proxyAuthenticationRequired = 407
    case requestTimeout = 408
    case conflict = 409
    case gone = 410
    case lengthRequired = 411
    case preconditionFailed = 412
    case payloadTooLarge = 413
    case uriTooLong = 414
    case unsupportedMediaType = 415
    case rangeNotSatisfiable = 416
    case expectationFailed = 417
    case imTeapot = 418
    case misdirectRequested = 421
    case unprocessableEntity = 422
    case locked = 423
    case failedDependency = 424
    case upgradeRequired = 426
    case preconditionRequired = 428
    case tooManyRequests = 429
    case requestHeaderFieldsTooLarge = 431
    case unavailableForLegalReasons = 451
    case unknown = -1
}

enum ServerError: Int, Error {
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailable = 503
    case gatewayTimeout = 504
    case httpVersionNotSupported = 505
    case variantAlsoNegotiates = 506
    case insufficientStorage = 507
    case loopDetected = 508
    case notExtended = 510
    case networkAuthenticationRequired = 511
    case unknown = -1
}
