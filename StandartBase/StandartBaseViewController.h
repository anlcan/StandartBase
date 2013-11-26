//
//  BaseViewController.h
//  StandartBase
//
//  Created by Anil Can Baykal on 9/4/12.
//  Copyright 2012 Anil Can Baykal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

//==============================================================================
#define _className(x)		        [NSString stringWithCString:class_getName([x class]) encoding:NSUTF8StringEncoding]

#if __has_feature(objc_arc)

#define _create(x)		(x*)[[x alloc] initWithNibName:_className(x) bundle:nil]

#else

#define _create(x)		(x*)[[[x alloc] initWithNibName:_className(x) bundle:nil] autorelease]

#endif

//==============================================================================
// VIEW CONTROLLER CONVENIENCE
#define PUSH(x)			[self.navigationController pushViewController:x animated:YES];

#define PUSH_BASE(x)	x * nextView = _create(x);\
						[self.navigationController pushViewController:nextView animated:YES];

#define PUSH_NAV(x)		x * nextView = _create(x);\
							UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:nextView];\
							[self.navigationController pushViewController:nav animated:YES];

#define MODAL(x)		[self.navigationController presentModalViewController:_create(x) animated:YES];

#define MODAL_NAV(x)		x * nextView = _create(x);\
							UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:nextView];\
							[self.navigationController presentViewController:nav animated:YES completion:nil];


#define MODAL_BASE(x)	[self.navigationController presentViewController:_create(x) animated:YES completion:nil];

#define DISMISS()	    if ( [self respondsToSelector:@selector(presentingViewController)])\
							[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];\
						else\
							[self.parentViewController dismissViewControllerAnimated:YES completion:nil];

#define POP()			[self.navigationController popViewControllerAnimated:YES];


// APPLICATION CONVENIENCE
#define APPDELEGATE		((AppDelegate*)[UIApplication sharedApplication].delegate)

//
// add to compiler  #if ! __has_feature(objc_arc)
#define _free(x)		[x release]; x = nil;

//==============================================================================
@interface StandartBaseViewController : UIViewController {
 
    UIActivityIndicatorView * _toolbarActivityIndicator;
}

-(void)startAnimateRightItem;
-(void)stopAnimateRightItem;
@end

//==============================================================================
@interface UIViewController(NavigationBarItem)

-(void)rightButtonWithTitle:(NSString *)title;
-(void)leftButtonWithTitle:(NSString *)title;

-(void)rightItemClicked:(id)sender;
-(void)leftItemClicked:(id)sender;


-(void)addDoneButton; 

@end

