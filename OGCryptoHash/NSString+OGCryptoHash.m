//
//  NSString+OGCryptoHash.m
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

#import <CommonCrypto/CommonCrypto.h>
#import "NSString+OGCryptoHash.h"

@implementation NSString (OGCryptoHash)

#pragma mark - Public

- (NSData *)og_dataUsingCryptoHashFunction:(OGCryptoHashFunction)function
{
	int len = [self _ogDigestLengthForCryptoHashFunction:function];
	unsigned char buffer[len];
	
	if (len < 0) return nil;
	
	switch (function)
    {
		case OGCryptoHashFunctionMD5:
			CC_MD5(self.UTF8String, (CC_LONG)self.length, buffer);
			break;
		case OGCryptoHashFunctionSHA1:
			CC_SHA1(self.UTF8String, (CC_LONG)self.length, buffer);
			break;
		case OGCryptoHashFunctionSHA224:
			CC_SHA224(self.UTF8String, (CC_LONG)self.length, buffer);
			break;
		case OGCryptoHashFunctionSHA256:
			CC_SHA256(self.UTF8String, (CC_LONG)self.length, buffer);
			break;
		case OGCryptoHashFunctionSHA384:
			CC_SHA384(self.UTF8String, (CC_LONG)self.length, buffer);
			break;
		case OGCryptoHashFunctionSHA512:
			CC_SHA512(self.UTF8String, (CC_LONG)self.length, buffer);
			break;
	}
	
	return [NSData dataWithBytes:buffer length:len];
}

- (NSData *)og_dataUsingCryptoHashFunction:(OGCryptoHashFunction)function hmacSignedWithKey:(NSString *)key
{
	int len              = [self _ogDigestLengthForCryptoHashFunction:function];
	CCHmacAlgorithm algo = [self _ogHmacAlgorithmForCryptoHashFunction:function];
	unsigned char buffer[len];
	
	if (len < 0 || algo == UINT32_MAX) return nil;
	
	CCHmac(algo, key.UTF8String, key.length, self.UTF8String, self.length, buffer);
	return [NSData dataWithBytes:buffer length:len];
}

- (NSString *)og_stringUsingCryptoHashFunction:(OGCryptoHashFunction)function
{
    return [self.class _ogHexadecimalString:[self og_dataUsingCryptoHashFunction:function]];
}

- (NSString *)og_stringUsingCryptoHashFunction:(OGCryptoHashFunction)function hmacSignedWithKey:(NSString *)key
{
    return [self.class _ogHexadecimalString:[self og_dataUsingCryptoHashFunction:function hmacSignedWithKey:key]];
}

#pragma mark - Private

- (int)_ogDigestLengthForCryptoHashFunction:(OGCryptoHashFunction)function
{
	switch (function)
    {
		case OGCryptoHashFunctionMD5:
			return CC_MD5_DIGEST_LENGTH;
		case OGCryptoHashFunctionSHA1:
			return CC_SHA1_DIGEST_LENGTH;
		case OGCryptoHashFunctionSHA224:
			return CC_SHA224_DIGEST_LENGTH;
		case OGCryptoHashFunctionSHA256:
			return CC_SHA256_DIGEST_LENGTH;
		case OGCryptoHashFunctionSHA384:
			return CC_SHA384_DIGEST_LENGTH;
		case OGCryptoHashFunctionSHA512:
			return CC_SHA512_DIGEST_LENGTH;
		default:
			return -1;
	}
}

- (CCHmacAlgorithm)_ogHmacAlgorithmForCryptoHashFunction:(OGCryptoHashFunction)function
{
	switch (function)
    {
		case OGCryptoHashFunctionMD5:
			return kCCHmacAlgMD5;
		case OGCryptoHashFunctionSHA1:
			return kCCHmacAlgSHA1;
		case OGCryptoHashFunctionSHA224:
			return kCCHmacAlgSHA224;
		case OGCryptoHashFunctionSHA256:
			return kCCHmacAlgSHA256;
		case OGCryptoHashFunctionSHA384:
			return kCCHmacAlgSHA384;
		case OGCryptoHashFunctionSHA512:
			return kCCHmacAlgSHA512;
		default:
			return UINT32_MAX;
	}
}

+ (NSString *)_ogHexadecimalString:(NSData *)data
{
    const unsigned char* buffer = data.bytes;
    NSUInteger length			= data.length;
    
    if (!buffer || !length) return nil;
    
    NSMutableString* string	= [NSMutableString stringWithCapacity:length*2];
    
    for (NSUInteger i = 0; i < length; i++)
    {
        [string appendFormat:@"%02x", buffer[i]];
    }
    
    return [NSString stringWithString:string];
}

@end
