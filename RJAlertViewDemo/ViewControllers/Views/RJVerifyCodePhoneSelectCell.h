//
//  RJVerifyCodePhoneSelectCell.h
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2020/12/8.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RJVerifyCodePhoneSelectCell : UITableViewCell

- (void)loadDataWithPhoneNumber:(NSString *)phoneNumber hideIcon:(BOOL)hideIcon separatorLineHide:(BOOL)separatorLineHide;

@end

NS_ASSUME_NONNULL_END
