//
//  BaseViewController.h
//  StandartBase
//
//  Created by Anil Can Baykal on 9/4/12.
//  Copyright 2012 Anil Can Baykal. All rights reserved.
//

#import <UIKit/UIKit.h>


//==============================================================================
@interface StandartBaseViewController : UIViewController {
 
    
}
@end

//==============================================================================
@interface StandartBaseViewController(NavigationBarItem)

-(void)rightButtonWithTitle:(NSString *)title;
-(void)leftButtonWithTitle:(NSString *)title;

-(void)rightItemClicked:(id)sender;
-(void)leftItemClicked:(id)sender;


-(void)addDoneButton; 

@end