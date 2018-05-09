//
//  KeyFile.swift
//  SCrypto
//
//  Created by Oskari Rauta on 09/05/2018.
//  Copyright © 2018 Oskari Rauta. All rights reserved.
//

import Foundation

public struct KeyFile {
    
    public var key: Data
    public var iv: Optional<Data>

    public enum Digest {
        case none
        case md2
        case md4
        case md5
        case sha1
        case sha224
        case sha256
        case sha384
        case sha512
        
        func digest(_ data: Data) -> Data {
            switch self {
            case .none: return data
            case .md2: return data.MD2()
            case .md4: return data.MD4()
            case .md5: return data.MD5()
            case .sha1: return data.SHA1()
            case .sha224: return data.SHA224()
            case .sha256: return data.SHA256()
            case .sha384: return data.SHA384()
            case .sha512: return data.SHA512()
            }
        }
        
    }
    
    public init(key: Data, iv: Data? = nil) {
        self.key = key
        self.iv = iv
    }
    
    public init(key: String, iv: String? = nil, digest: Digest = .sha256) {
        self.key = digest.digest(key.data(using: .utf8)!)
        self.iv = iv == nil ? nil : iv!.data(using: .utf8)!
    }
    
}
