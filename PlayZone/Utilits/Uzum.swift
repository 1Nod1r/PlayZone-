//
//  Uzum.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import Foundation

public class Uzum {
    
    public static func toValue<T: Codable>(_ data: Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    public static func toJson<T: Codable>(value: T) -> String? {
        let encoder = JSONEncoder()
        encoder.dataEncodingStrategy = .base64
        if let data = try? encoder.encode(value) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
}
