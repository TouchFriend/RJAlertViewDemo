//
//  RJPerson.m
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2020/12/3.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJPerson.h"

@implementation RJPerson

- (CGFloat)weight {
    return 20.0;
}


- (RJPerson * (^)(NSString *))eat {
    return ^id(NSString *food) {
        NSLog(@"eat--%@", food);
        return self;
    };
}

- (RJPerson * (^)(CGFloat))run {
    return ^id(CGFloat meter) {
        NSLog(@"run %lf meter", meter);
        return self;
    };
}

- (RJPerson * (^)(void))sleep {
    return ^{
        NSLog(@"sleep");
        return self;
    };
}

- (void)test:(NSString * _Nonnull (^)(NSString * _Nonnull))eat {
    if (eat) {
        NSString *dd = eat(@"aaa");
        NSLog(@"dd: %@", dd);
    }
    
}



@end
