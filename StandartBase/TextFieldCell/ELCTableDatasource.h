//
//  ELCTableDelegate.h
//  Skynet
//
//  Created by Anil Can Baykal on 11/20/13.
//  Copyright (c) 2013 Anil Can Baykal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ELCTextFieldCell.h"

@interface NSArray (NSIndexPath)

-(id)get:(NSIndexPath*)path;

@end

@interface ELCTableDatasource : NSObject<UITableViewDataSource, ELCTextFieldDelegate>{
    
    NSMutableArray * _textFields;
    
}
@property (nonatomic, weak) UITextField * activeField; //currently first responding field
@property (nonatomic, strong)NSArray * labels;
@property (nonatomic, strong)NSArray * placeholders;
@property (nonatomic, strong)NSArray * keyboardTypes;
@property (nonatomic, strong)NSMutableDictionary * values;
@property (nonatomic, strong)NSArray * toolTips;
@property (nonatomic, strong)NSArray * secures;
@property (nonatomic, strong)NSArray * images;

@property (nonatomic, strong)NSArray * maxLengths;


@property (nonatomic, strong) UIColor * labelColor;
@property (nonatomic, strong) UIFont * labelFont;


/* accessing values */
-(NSString *)valueAtIndex:(int)index;
-(void)setValue:(id)value atIndex:(int)index;

- (void)configureCell:(ELCTextFieldCell *)cell atIndexPath:(NSIndexPath *)indexPath;
-(void)validate:(UITextField*)textField;

@end
