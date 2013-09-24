//
//  BaseViewController.h
//  StandartBase
//
//  Created by Anil Can Baykal on 9/4/12.
//  Copyright 2012 Anil Can Baykal. All rights reserved.
//

#import <UIKit/UIKit.h>


//==============================================================================
// VIEW CONTROLLER CONVENIENCE
#define PUSH(x)			[self.navigationController pushViewController:x animated:YES];

#define PUSH_BASE(x)	x * nextView = _create(x);\
						[self.navigationController pushViewController:nextView animated:YES];


#define MODAL(x)		[self.navigationController presentViewController:_create(x) animated:YES completion:nil];

#define MODAL_NAV(x)		x * nextView = _create(x);\
							UINavigationController * _nav = [[UINavigationController alloc] initWithRootViewController:nextView];\
							[self.navigationController presentViewController:_nav animated:YES completion:nil];

#define MODAL_BASE(x)	[self.navigationController presentModalViewController:_create(x) animated:YES];

#define DISMISS()	    if ( [self respondsToSelector:@selector(presentingViewController)])\
							[self.presentingViewController dismissModalViewControllerAnimated:YES];\
						else\
							[self.parentViewController dismissModalViewControllerAnimated:YES];

#define POP()			[self.navigationController popViewControllerAnimated:YES];


// APPLICATION CONVENIENCE
#define APPDELEGATE		((AppDelegate*)[UIApplication sharedApplication].delegate)

//
// add to compiler  #if ! __has_feature(objc_arc)
#define _free(x)		[x release]; x = nil;

//==============================================================================
@interface StandartBaseViewController : UIViewController {
 
    
}
@end

//==============================================================================
@interface UIViewController (UITableView)
-(void)addNoDataMessage:(NSString *)message;

@end

//==============================================================================
@interface UIViewController(NavigationBarItem)

-(void)rightButtonWithTitle:(NSString *)title;
-(void)leftButtonWithTitle:(NSString *)title;

-(UIBarButtonItem *)rightButtonWithImage:(NSString *)imageName;
-(UIBarButtonItem *)leftButtonWithImage:(NSString *)imageName;

-(void)activateRightItem;
-(void)stopRightActivity;

-(void)rightItemClicked:(id)sender;
-(void)leftItemClicked:(id)sender;


-(void)addDoneButton; 

@end

