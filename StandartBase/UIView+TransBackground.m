//
//  UIView+TransBackground.m
//  purtales
//
//  Created by Anil Can Baykal on 1/16/13.
//  Copyright (c) 2013 Happy Blue Duck. All rights reserved.
//

#import "UIView+TransBackground.h"

@implementation UIView (TransBackground)

-(void)addTransBackground{
    UIView * v = [[[UIView alloc] initWithFrame:self.bounds] autorelease];
    v.backgroundColor = [UIColor blackColor];
    v.alpha = 0.7;
    v.tag = kTransBackground; 
    
    [self addSubview:v];
    [self sendSubviewToBack:v];
}

-(void)removerTransBackground{
    [[self viewWithTag:kTransBackground] removeFromSuperview]; 
}

@end
