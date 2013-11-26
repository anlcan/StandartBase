//
//  BaseViewController.m
//  StandartBase
//
//  Created by Anil Can Baykal on 9/4/12.
//  Copyright 2012 Anil Can Baykal. All rights reserved.
//

#import "StandartBaseViewController.h"


@implementation StandartBaseViewController


//==============================================================================
-(void)viewDidLoad{

	[super viewDidLoad];
}

-(void)	viewDidAppear:(BOOL)animated{

	[super viewDidAppear:animated];
}

-(void)	viewWillAppear:(BOOL)animated{

	[super viewWillAppear:animated];
}


-(void)startAnimateRightItem{
    _toolbarActivityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _toolbarActivityIndicator.hidesWhenStopped = YES;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_toolbarActivityIndicator];
    [_toolbarActivityIndicator startAnimating];
}

-(void)stopAnimateRightItem{
    [_toolbarActivityIndicator stopAnimating];
    _toolbarActivityIndicator = nil;
}

//==============================================================================

@end


@implementation UIViewController (NavigatinBarItem)
-(UIBarButtonItem*)buttWithTitle:(NSString *)title forSelector:(SEL)sel{
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithTitle:title
                                                              style:UIBarButtonItemStyleBordered
                                                             target:self
                                                             action:sel];
    return item;
}


-(void)rightButtonWithTitle:(NSString *)title{
    
    UIBarButtonItem *rightButton = [self buttWithTitle:title forSelector:@selector(rightItemClicked:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
}

-(void)leftButtonWithTitle:(NSString *)title{
    UIBarButtonItem *leftButton = [self buttWithTitle:title forSelector:@selector(leftItemClicked:)];
    self.navigationItem.leftBarButtonItem = leftButton;
}



-(void)rightItemClicked:(id)sender{
    // base imp
}
-(void)leftItemClicked:(id)sender{
    // base imp
}



//==============================================================================

@end
