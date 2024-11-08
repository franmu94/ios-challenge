//
//  NetworkInteractor.swift
//  Challenge
//
//  Created by Fran Malo on 8/11/24.
//

import Foundation

protocol NetworkInteractor {
    func getJSON<JSON>(request: URLRequest, type: JSON.Type) async throws -> JSON where JSON: Codable
    
    func postJSON(request: URLRequest) async throws
}

extension NetworkInteractor {
    func getJSON<JSON>(request: URLRequest, type: JSON.Type) async throws -> JSON where JSON: Codable {
        let (data, response) = try await URLSession.shared.getData(for: request)
        
        if response.statusCode == 200 {
            do {
                return try JSONDecoder().decode(type, from: data)
            } catch {
                throw NetworkError.json(error)
            }
        } else {
            throw NetworkError.status(response.statusCode)
        }
    }
    
    func postJSON(request: URLRequest) async throws {
        let (_, response) = try await URLSession.shared.getData(for: request)
        if response.statusCode != 200 {
            throw NetworkError.status(response.statusCode)
        }
    }
}
