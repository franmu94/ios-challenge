//
//  URLSession.swift
//  Challenge
//
//  Created by Fran Malo on 8/11/24.
//

import Foundation

extension URLSession {
    func getData(from url: URL) async throws -> (data: Data, response: HTTPURLResponse) {
        do {
            let (data, response) = try await data(from: url)
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.nonHTTP
            }
            return (data, response)
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.general(error)
        }
    }
    
    func getData(for request: URLRequest) async throws -> (data: Data, response: HTTPURLResponse) {
        do {
            let (data, response) = try await data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.nonHTTP
            }
            return (data, response)
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.general(error)
        }
    }
}
