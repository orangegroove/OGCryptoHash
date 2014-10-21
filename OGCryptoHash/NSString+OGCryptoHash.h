//
//  NSString+OGCryptoHash.h
//
//  Created by Jesper <jesper@orangegroove.net>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
//

/*
 Category that wraps string hashing and hmac signing functions.
 */

@import Foundation;

/**
 The available hash functions.
 */
typedef NS_ENUM(NSUInteger, OGCryptoHashFunction)
{
	OGCryptoHashFunctionMD5,
	OGCryptoHashFunctionSHA1,
	OGCryptoHashFunctionSHA224,
	OGCryptoHashFunctionSHA256,
	OGCryptoHashFunctionSHA384,
	OGCryptoHashFunctionSHA512
};

@interface NSString (OGCryptoHash)

/**
 Hashes a string.
 @param function The hash function to use.
 @return The hashed string as bytes.
 */
- (NSData *)og_dataUsingCryptoHashFunction:(OGCryptoHashFunction)function;

/**
 Hashes a string and HMAC signs it.
 @param function The hash function to use.
 @param key The HMAC key.
 @return The hashed string as bytes.
 */
- (NSData *)og_dataUsingCryptoHashFunction:(OGCryptoHashFunction)function hmacSignedWithKey:(NSString *)key;

/**
 Hashes a string.
 @param function The hash function to use.
 @return The hashed string as a string of hexadecimal bytes.
 */
- (NSString *)og_stringUsingCryptoHashFunction:(OGCryptoHashFunction)function;

/**
 Hashes a string and HMAC signs it.
 @param function The hash function to use.
 @param key The HMAC key.
 @return The hashed string as a string of hexadecimal bytes.
 */
- (NSString *)og_stringUsingCryptoHashFunction:(OGCryptoHashFunction)function hmacSignedWithKey:(NSString *)key;

@end
