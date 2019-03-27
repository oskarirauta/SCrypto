//
//  Data.swift
//  SCrypto
//
//  Created by Oskari Rauta on 09/05/2018.
//  Copyright © 2018 Oskari Rauta. All rights reserved.
//

import Foundation
import CommonCrypto

public extension Data {
    
    var md5: String {
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        _ =  self.withUnsafeBytes { bytes -> String in
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

public extension Data {
    
    func encrypt(_ algorithm: Cipher.Algorithm = .aes, options: Cipher.Options = .PKCS7Padding, key: KeyFile) throws -> Data {
        let cipher = Cipher(algorithm: algorithm, options: options, iv: key.iv?.bytesArray())
        let encryptedBytes = try cipher.encrypt(self.bytesArray(), key: key.key.bytesArray())
        return Data(bytes: UnsafePointer<UInt8>(encryptedBytes), count: encryptedBytes.count)
    }

    func decrypt(_ algorithm: Cipher.Algorithm = .aes, options: Cipher.Options = .PKCS7Padding, key: KeyFile) throws -> Data {
        let cipher = Cipher(algorithm: algorithm, options: options, iv: key.iv?.bytesArray())
        let decryptedBytes = try cipher.decrypt(self.bytesArray(), key: key.key.bytesArray())
        return Data(bytes: UnsafePointer<UInt8>(decryptedBytes), count: decryptedBytes.count)
    }

    
}
