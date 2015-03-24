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


//  Created by Tim on 07/09/2012.
//  Copyright (c) 2012 Charismatic Megafauna Ltd. All rights reserved.
//


@implementation UIColor (HexColors)

+(UIColor *)colorWithHexString:(NSString *)hexString {
    
    if ([hexString length] != 6) {
        return nil;
    }
    
    // Brutal and not-very elegant test for non hex-numeric characters
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^a-fA-F|0-9]" options:0 error:NULL];
    NSUInteger match = [regex numberOfMatchesInString:hexString options:NSMatchingReportCompletion range:NSMakeRange(0, [hexString length])];
    
    if (match != 0) {
        return nil;
    }
    
    NSRange rRange = NSMakeRange(0, 2);
    NSString *rComponent = [hexString substringWithRange:rRange];
    NSUInteger rVal = 0;
    NSScanner *rScanner = [NSScanner scannerWithString:rComponent];
    [rScanner scanHexInt:&rVal];
    float rRetVal = (float)rVal / 254;
    
    
    NSRange gRange = NSMakeRange(2, 2);
    NSString *gComponent = [hexString substringWithRange:gRange];
    NSUInteger gVal = 0;
    NSScanner *gScanner = [NSScanner scannerWithString:gComponent];
    [gScanner scanHexInt:&gVal];
    float gRetVal = (float)gVal / 254;
    
    NSRange bRange = NSMakeRange(4, 2);
    NSString *bComponent = [hexString substringWithRange:bRange];
    NSUInteger bVal = 0;
    NSScanner *bScanner = [NSScanner scannerWithString:bComponent];
    [bScanner scanHexInt:&bVal];
    float bRetVal = (float)bVal / 254;
    
    return [UIColor colorWithRed:rRetVal green:gRetVal blue:bRetVal alpha:1.0f];
    
}

+(NSString *)hexValuesFromUIColor:(UIColor *)color {
    
    if (!color) {
        return nil;
    }
    
    if (color == [UIColor whiteColor]) {
        // Special case, as white doesn't fall into the RGB color space
        return @"ffffff";
    }
    
    CGFloat red;
    CGFloat blue;
    CGFloat green;
    CGFloat alpha;
    
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    int redDec = (int)(red * 255);
    int greenDec = (int)(green * 255);
    int blueDec = (int)(blue * 255);
    
    NSString *returnString = [NSString stringWithFormat:@"%02x%02x%02x", (unsigned int)redDec, (unsigned int)greenDec, (unsigned int)blueDec];
    
    return returnString;
    
}
@end