//
//  Data.swift
//  SCrypto
//
//  Created by Oskari Rauta on 09/05/2018.
//  Copyright © 2018 Oskari Rauta. All rights reserved.
//

import Foundation

public extension Data {
    
    public func encrypt(_ algorithm: Cipher.Algorithm = .aes, options: Cipher.Options = .PKCS7Padding, key: KeyFile) throws -> Data {
        let cipher = Cipher(algorithm: algorithm, options: options, iv: key.iv?.bytesArray())
        let encryptedBytes = try cipher.encrypt(self.bytesArray(), key: key.key.bytesArray())
        return Data(bytes: UnsafePointer<UInt8>(encryptedBytes), count: encryptedBytes.count)
    }

    public func decrypt(_ algorithm: Cipher.Algorithm = .aes, options: Cipher.Options = .PKCS7Padding, key: KeyFile) throws -> Data {
        let cipher = Cipher(algorithm: algorithm, options: options, iv: key.iv?.bytesArray())
        let decryptedBytes = try cipher.decrypt(self.bytesArray(), key: key.key.bytesArray())
        return Data(bytes: UnsafePointer<UInt8>(decryptedBytes), count: decryptedBytes.count)
    }

    
}
