//
//  AppManager.m
//  BirPaketAsk
//
//  Created by Anil Can Baykal on 10/18/12.
//  Copyright 2012 Anil Can Baykal. All rights reserved.
//

#import "StandartAppManager.h"

static StandartAppManager* _sharedInstance = nil;
@implementation StandartAppManager


//==============================================================================

+(void)initialize{
    
    static BOOL initialized = NO; 
    if ( !initialized){
        initialized = YES; 
        _sharedInstance = [StandartAppManager new]; 
    }
}

+(StandartAppManager*)shared{
    return _sharedInstance; 
}


//==============================================================================



@end
