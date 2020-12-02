//
//  UIImage+RJAlertViewControllerAdd.m
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2020/12/2.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "UIImage+RJAlertViewControllerAdd.h"

@implementation UIImage (RJAlertViewControllerAdd)

+ (UIImage *)rj_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0, 0.0, 1.0, 1.0);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, color.CGColor);
    CGContextFillRect(contextRef, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
