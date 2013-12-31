# What is this?

Wrapper around CommonCrypto hash functions, MD5, SHA1, SHA224, SHA256, SHA384, and SHA512.

# Installation

1. Add as a pod.
2. Import NSString+OGCryptoHash.h in prefix.pch.

# Documentation

It's very easy to use:

	NSData* md5 = [@"a string" dataUsingCryptoHashFunction:OGCryptoHashFunctionMD5];

