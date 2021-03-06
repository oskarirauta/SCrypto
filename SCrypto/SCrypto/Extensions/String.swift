//
//  String.swift
//  SCrypto
//
//  Created by Oskari Rauta on 09/05/2018.
//  Copyright © 2018 Oskari Rauta. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    
    var md5: String {
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        _ =  self.data(using: .utf8)!.withUnsafeBytes { bytes -> String in
            CC_MD5(bytes.baseAddress, CC_LONG(self.count), &digest)
            return ""
        }
        var digestHex = ""
        for index in 0..<Int(CC_MD5_DIGEST_LENGTH) {
            digestHex += String(format: "%02x", digest[index])
        }
        return digestHex
    }
    
}

public extension String {

    init?(encryptedString: String, algorithm: Cipher.Algorithm = .aes, options: Cipher.Options = .PKCS7Padding, key: Data, iv: Data? = nil) {
        guard
            let encryptedData: Data = Data(base64Encoded: encryptedString),
            let deciphered: Data = try? encryptedData.decrypt(algorithm, options: options, key: key, iv: iv),
            let text: String = String(data: deciphered, encoding: .utf8)
            else { return nil }
        self = text
    }

    init?(encryptedString: String, algorithm: Cipher.Algorithm = .aes, options: Cipher.Options = .PKCS7Padding, key: KeyFile) {
        guard
            let encryptedData: Data = Data(base64Encoded: encryptedString),
            let deciphered: Data = try? encryptedData.decrypt(algorithm, options: options, key: key),
            let text: String = String(data: deciphered, encoding: .utf8)
            else { return nil }
        self = text
    }
    
    init?(_ encryptedData: Data, algorithm: Cipher.Algorithm = .aes, options: Cipher.Options = .PKCS7Padding, key: Data, iv: Data? = nil) {
        guard let deciphered: Data = try? encryptedData.decrypt(algorithm, options: options, key: key, iv: iv) else { return nil }
        self = deciphered.base64EncodedString()
    }

    init?(_ encryptedData: Data, algorithm: Cipher.Algorithm = .aes, options: Cipher.Options = .PKCS7Padding, key: KeyFile) {
        guard let deciphered: Data = try? encryptedData.decrypt(algorithm, options: options, key: key) else { return nil }
        self = deciphered.base64EncodedString()
    }
    
    init?(_ content: String, algorithm: Cipher.Algorithm = .aes, options: Cipher.Options = .PKCS7Padding, key: Data, iv: Data? = nil) {
        guard
            let data: Data = try? content.encrypted(algorithm, options: options, key: key, iv: iv)
            else { return nil }
        self = data.base64EncodedString()
    }

    init?(_ content: String, algorithm: Cipher.Algorithm = .aes, options: Cipher.Options = .PKCS7Padding, key: KeyFile) {
        guard
            let data: Data = try? content.encrypted(algorithm, options: options, key: key)
            else { return nil }
        self = data.base64EncodedString()
    }
    
    func encrypted(_ algorithm: Cipher.Algorithm = .aes, options: Cipher.Options = .PKCS7Padding, key: Data, iv: Data? = nil) throws -> Data {
        return try self.data(using: .utf8)!.encrypt(algorithm, options: options, key: key, iv: iv)
    }

    func encrypted(_ algorithm: Cipher.Algorithm = .aes, options: Cipher.Options = .PKCS7Padding, key: KeyFile) throws -> Data {
        return try self.data(using: .utf8)!.encrypt(algorithm, options: options, key: key)
    }
    
}
