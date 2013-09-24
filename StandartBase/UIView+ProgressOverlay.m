//
//  UIView+ProgressOverlay.m
//  KarnavaliPad
//
//  Created by Anil Can Baykal on 1/25/13.
//  Copyright (c) 2013 Anil Can Baykal. All rights reserved.
//

#import "UIView+ProgressOverlay.h"

@implementation UIView (ProgressOverlay)

-(void)addOverylay:(NSString *)msg{
    
    UIView * overlay = [[[UIView alloc] initWithFrame:self.bounds] autorelease];
    overlay.backgroundColor = [UIColor clearColor];
    

    overlay.backgroundColor = [UIColor clearColor];
    
    UILabel * lbl = [[[UILabel alloc] initWithFrame:self.bounds] autorelease];
    lbl.textColor = [UIColor whiteColor];
    lbl.backgroundColor = [UIColor whiteColor];
    
    lbl.text = msg;
    
}

-(void)dismissOverlay{
    
}

@end
