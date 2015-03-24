//
//  StandartUtil.h
//  Skynet
//
//  Created by Anil Can Baykal on 11/20/13.
//  Copyright (c) 2013 Anil Can Baykal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StandartUtil : NSObject
+(NSString*)computeSHA256DigestForString:(NSString*)input;
@end

@interface UIColor (HexColors)

+(UIColor *)colorWithHexString:(NSString *)hexString;
+(NSString *)hexValuesFromUIColor:(UIColor *)color;

@end