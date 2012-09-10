//
//  Created by Anil Can Baykal on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSObject+Util.h"

@implementation NSObject(Util)


//==============================================================================
-(id)safePerformSelector:(SEL)aSelector withObject:(id)arg{
    
    if ([self respondsToSelector:aSelector]){
       return  [self performSelector:aSelector withObject:arg]; 
    }
    return nil; 
}

- (id)safePerformSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2 {

    if ([self respondsToSelector:aSelector]){
        return [self performSelector:aSelector withObject:object1 withObject:object2]; 
    }
    return nil;     
}

@end
