//
//  RJMultipleAccountSelectCell.h
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2021/1/21.
//  Copyright © 2021 RJSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RJMultipleAccountSelectCell : UITableViewCell

- (void)loadDataWithPhoneNumber:(NSString *)phoneNumber hideIcon:(BOOL)hideIcon separatorLineHide:(BOOL)separatorLineHide;

@end

NS_ASSUME_NONNULL_END
