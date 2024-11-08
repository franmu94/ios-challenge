//
//  NetworkError.swift
//  Challenge
//
//  Created by Fran Malo on 8/11/24.
//

import Foundation

enum NetworkError1: LocalizedError{
    case nonHTTPURLResponse
    case badStatusCode(Int)
    case JSONDecoderError(Error)
    var errorDescription: String {
        switch self {
        case .nonHTTPURLResponse:
            "Can not cast to HTTURLResponse."
        case .badStatusCode(let statusCode):
            "Bad Status code: \(statusCode)."
        case .JSONDecoderError(let decodeError):
            "Decoding JSON Error: \(decodeError)."
        }
    }
}

enum NetworkError: LocalizedError {
    case general(Error)
    case status(Int)
    case json(Error)
    case dataNotValid
    case nonHTTP
    
    var errorDescription: String? {
        switch self {
            case .general(let error):
                "Error general: \(error.localizedDescription)"
            case .status(let int):
                "Error de status: \(int)."
            case .json(let error):
                "Error de JSON: \(error)."
            case .dataNotValid:
                "Error, dato no válido."
            case .nonHTTP:
                "No es una conexión HTTP."
        }
    }
}
