//
//  RJPerson.h
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2020/12/3.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJDog.h"

NS_ASSUME_NONNULL_BEGIN

@interface RJPerson : NSObject

/// <#Desription#>
@property (nonatomic, copy) NSString *name;
/// <#Desription#>
@property (nonatomic, strong) RJDog *dog;


- (RJPerson * (^)(NSString *food))eat;

- (RJPerson * (^)(CGFloat meter))run;

- (RJPerson * (^)(void))sleep;

- (void)test:(NSString * (^)(NSString *name))eat;

@end

NS_ASSUME_NONNULL_END
