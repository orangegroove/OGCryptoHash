//
//  OGCryptoHashProjectTests.m
//  OGCryptoHashProjectTests
//
//  Created by Jesper on 31/12/13.
//  Copyright (c) 2013 Orange Groove. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+OGCryptoHash.h"

@interface OGCryptoHashProjectTests : XCTestCase

@end

@implementation OGCryptoHashProjectTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testHash
{
    NSString* test   = @"test";
    NSString* md5    = [test og_stringUsingCryptoHashFunction:OGCryptoHashFunctionMD5];
    NSString* sha1   = [test og_stringUsingCryptoHashFunction:OGCryptoHashFunctionSHA1];
    NSString* sha224 = [test og_stringUsingCryptoHashFunction:OGCryptoHashFunctionSHA224];
    NSString* sha256 = [test og_stringUsingCryptoHashFunction:OGCryptoHashFunctionSHA256];
    NSString* sha384 = [test og_stringUsingCryptoHashFunction:OGCryptoHashFunctionSHA384];
    NSString* sha512 = [test og_stringUsingCryptoHashFunction:OGCryptoHashFunctionSHA512];
    
    XCTAssert([md5 isEqualToString:@"098f6bcd4621d373cade4e832627b4f6"]);
    XCTAssert([sha1 isEqualToString:@"a94a8fe5ccb19ba61c4c0873d391e987982fbbd3"]);
    XCTAssert([sha224 isEqualToString:@"90a3ed9e32b2aaf4c61c410eb925426119e1a9dc53d4286ade99a809"]);
    XCTAssert([sha256 isEqualToString:@"9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08"]);
    XCTAssert([sha384 isEqualToString:@"768412320f7b0aa5812fce428dc4706b3cae50e02a64caa16a782249bfe8efc4b7ef1ccb126255d196047dfedf17a0a9"]);
    XCTAssert([sha512 isEqualToString:@"ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff"]);
}

- (void)testHmac
{
    NSString* test   = @"test";
    NSString* key    = @"key";
    NSString* md5    = [test og_stringUsingCryptoHashFunction:OGCryptoHashFunctionMD5 hmacSignedWithKey:key];
    NSString* sha1   = [test og_stringUsingCryptoHashFunction:OGCryptoHashFunctionSHA1 hmacSignedWithKey:key];
    NSString* sha224 = [test og_stringUsingCryptoHashFunction:OGCryptoHashFunctionSHA224 hmacSignedWithKey:key];
    NSString* sha256 = [test og_stringUsingCryptoHashFunction:OGCryptoHashFunctionSHA256 hmacSignedWithKey:key];
    NSString* sha384 = [test og_stringUsingCryptoHashFunction:OGCryptoHashFunctionSHA384 hmacSignedWithKey:key];
    NSString* sha512 = [test og_stringUsingCryptoHashFunction:OGCryptoHashFunctionSHA512 hmacSignedWithKey:key];
    
    XCTAssert([md5 isEqualToString:@"1d4a2743c056e467ff3f09c9af31de7e"]);
    XCTAssert([sha1 isEqualToString:@"671f54ce0c540f78ffe1e26dcf9c2a047aea4fda"]);
    XCTAssert([sha224 isEqualToString:@"76b34b643e71d7d92afd4c689c0949cbe0c5445feae907aac532a5a1"]);
    XCTAssert([sha256 isEqualToString:@"02afb56304902c656fcb737cdd03de6205bb6d401da2812efd9b2d36a08af159"]);
    XCTAssert([sha384 isEqualToString:@"160a099ad9d6dadb46311cb4e6dfe98aca9ca519c2e0fedc8dc45da419b1173039cc131f0b5f68b2bbc2b635109b57a8"]);
    XCTAssert([sha512 isEqualToString:@"287a0fb89a7fbdfa5b5538636918e537a5b83065e4ff331268b7aaa115dde047a9b0f4fb5b828608fc0b6327f10055f7637b058e9e0dbb9e698901a3e6dd461c"]);
}

@end
