//
//  ELCTableDelegate.m
//  Skynet
//
//  Created by Anil Can Baykal on 11/20/13.
//  Copyright (c) 2013 Anil Can Baykal. All rights reserved.
//

#import "ELCTableDatasource.h"
@implementation NSArray(NSIndexPath)
-(id)get:(NSIndexPath *)path{
    static BOOL isGrouped = YES;
    
    if (isGrouped && self.count > path.section){
        NSObject* item = [self objectAtIndex:path.section];
        if ([item isMemberOfClass:[NSArray class]]){
            isGrouped = YES;
            return [(NSArray*)item objectAtIndex:path.row];
        } else {
            isGrouped = NO;
        }
    }
    
    return [self objectAtIndex:path.row];
    
}

@end


//==============================================================================
@implementation ELCTableDatasource


- (id)init
{
    self = [super init];
    if (self) {
        self.values = [NSMutableDictionary dictionaryWithCapacity:3];
    }
    return self;
}


//==============================================================================
-(void)setValue:(id)value atIndex:(int)index{
    [self.values setObject:value
                    forKey:[self.labels objectAtIndex:index]];
}

-(NSString *)valueAtIndex:(int)index{
    return [self.values objectForKey:[self.labels objectAtIndex:index]];
}



//==============================================================================
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.labels count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* cellIdentifier = @"ELCTextFieldCell";
    
    ELCTextFieldCell *cell = (ELCTextFieldCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[ELCTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(ELCTextFieldCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    cell.leftLabel.text = [self.labels objectAtIndex:indexPath.row];
    cell.rightTextField.placeholder = [self.placeholders objectAtIndex:indexPath.row];
    cell.indexPath = indexPath;
    cell.delegate = self;
    //Disables UITableViewCell from accidentally becoming selected.
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    
    cell.rightTextField.text = [self.values objectForKey: cell.leftLabel.text ];
    
    if ( self.keyboardTypes != nil && self.keyboardTypes.count > indexPath.row){
        cell.rightTextField.keyboardType = [[self.keyboardTypes objectAtIndex:indexPath.row] intValue];
    }
    
    if (self.maxLengths != nil && self.maxLengths.count > indexPath.row){
        cell.maxLength = [[self.maxLengths objectAtIndex:indexPath.row] intValue];
    }
    
    cell.rightTextField.secureTextEntry = NO; 
    if (self.secures != nil && self.secures.count > indexPath.row){
        cell.rightTextField.secureTextEntry = [[self.secures objectAtIndex:indexPath.row] boolValue];
    }
    
//    if (self.toolTips != nil && self.toolTips.count > indexPath.row && [[self.toolTips objectAtIndex:indexPath.row] length] > 0){
//        cell.rightTextField.rightView = [UIButton buttonWithType:UIButtonTypeInfoDark];
//        cell.rightTextField.rightViewMode = UITextFieldViewModeAlways;
//    } else {
//        cell.rightTextField.rightView = nil; 
//
//    }
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.activeField = textField;
}

- (void)textFieldCell:(ELCTextFieldCell *)inCell updateTextLabelAtIndexPath:(NSIndexPath *)inIndexPath string:(NSString *)inValue{
    [self.values setObject:inValue
                    forKey:[self.labels objectAtIndex:inIndexPath.row]];
    
    self.activeField = inCell.rightTextField;
    [self validate:inCell.rightTextField];
}

-(BOOL)textFieldCell:(ELCTextFieldCell *)inCell shouldReturnForIndexPath:(NSIndexPath *)inIndexPath withValue:(NSString *)inValue{
//    int sectionCount = [self numberOfSectionsInTableView:_tableView];
//    int rowCount = [self tableView:nil numberOfRowsInSection:inIndexPath.section];
//    
//    int nextSection = inIndexPath.section;
//    int nextRow = inIndexPath.row + 1;
//    if ( nextRow == rowCount){
//        nextSection++;
//        nextRow = 0;
//    }
//    
//    if ( nextSection == sectionCount){
//        nextSection = 0;
//    }
//    
//    ELCTextFieldCell * cell = (ELCTextFieldCell*)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:nextRow inSection:nextSection]];
//    [cell.rightTextField becomeFirstResponder];
//    
    return NO;
}



-(void)validate:(UITextField*)textField{
    
}

@end
