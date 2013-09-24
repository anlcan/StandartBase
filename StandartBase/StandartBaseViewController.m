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



//==============================================================================
-(void)dealloc{

	[super dealloc];
}
//==============================================================================
@end



//==============================================================================
@implementation UIViewController(UITableView)
-(void)addNoDataMessage:(NSString *)message{
    
}

-(UIView*)footerButton:(NSString *)text{
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    view.backgroundColor = [UIColor clearColor];
    UIButton * login = [UIButton buttonWithType:UIButtonTypeCustom];
    login.frame = CGRectMake(200, 10, 100, 20);
    [login setTitle:@"Sifremi unuttum" forState:UIControlStateNormal];
    [login.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [login.titleLabel setTextColor:[UIColor grayColor]];
    [view addSubview:login];
    
    return view;
}

@end

//==============================================================================

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

-(UIBarButtonItem *)rightButtonWithImage:(NSString *)imageName{
    UIButton * qrIcon = [UIButton buttonWithType:UIButtonTypeCustom];
    [qrIcon setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //qrIcon.frame = CGRectMake(0,0,35, 35);
    [qrIcon sizeToFit];
    [qrIcon addTarget:self action:@selector(rightItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButton = [[[UIBarButtonItem alloc] initWithCustomView:qrIcon] autorelease];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    return rightButton;
}

-(UIBarButtonItem *)leftButtonWithImage:(NSString *)imageName{
    UIBarButtonItem *button = [[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName]
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(leftItemClicked:)]
                               autorelease];
    
    self.navigationItem.leftBarButtonItem = button;
    return button;
}


-(void)activateRightItem{
    UIActivityIndicatorView *rightItemActivity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    UIBarButtonItem * rightButton = [[[UIBarButtonItem alloc] initWithCustomView:rightItemActivity] autorelease];
    self.navigationItem.rightBarButtonItem = rightButton;
    [rightItemActivity startAnimating];
    
}

-(void)stopRightActivity{
    UIBarButtonItem * rightButton = self.navigationItem.rightBarButtonItem ;
    [(UIActivityIndicatorView*)rightButton.customView stopAnimating];
    self.navigationItem.rightBarButtonItem = nil;
}

-(void)rightItemClicked:(id)sender{
    // base imp
}
-(void)leftItemClicked:(id)sender{
    // base imp
}



//==============================================================================

@end