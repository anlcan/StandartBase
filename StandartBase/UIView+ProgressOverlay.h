//
//  UIView+ProgressOverlay.h
//  KarnavaliPad
//
//  Created by Anil Can Baykal on 1/25/13.
//  Copyright (c) 2013 Anil Can Baykal. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TAG_OVERLAY	1039

@interface UIView (ProgressOverlay)

-(void)addOverylay:(NSString *)msg;
-(void)dismissOverlay;

@end
