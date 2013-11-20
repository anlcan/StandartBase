//
//  StandartUtil.m
//  Skynet
//
//  Created by Anil Can Baykal on 11/20/13.
//  Copyright (c) 2013 Anil Can Baykal. All rights reserved.
//

#import "StandartUtil.h"
#import <CommonCrypto/CommonHMAC.h>

@implementation StandartUtil

// This is where the rest of the magic happens.
// Here we are taking in our string hash, placing that inside of a C Char Array,
// then parsing it through the SHA256 encryption method.
+(NSString*)computeSHA256DigestForString:(NSString*)input{
    
    const char *cstr 	= [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data 		= [NSData dataWithBytes:cstr length:input.length];
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    
    // This is an iOS5-specific method.
    // It takes in the data, how much data, and then output format, which in this case is an int array.
    CC_SHA256(data.bytes, data.length, digest);
    
    // Setup our Objective-C output in HEX
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    
    // Parse through the CC_SHA256 results (stored inside of digest[]).
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

@end
