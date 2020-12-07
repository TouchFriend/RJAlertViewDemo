//
//  RJReactiveChainDemoViewController.m
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2020/12/3.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJReactiveChainDemoViewController.h"
#import "RJPerson.h"
#import <Masonry/Masonry.h>

@interface RJReactiveChainDemoViewController ()

/// <#Desription#>
@property (nonatomic, copy) NSString * (^testBlock)(NSString *name);



@end

@implementation RJReactiveChainDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    RJPerson *person = [[RJPerson alloc] init];
    person.eat(@"hamburger").run(12.54).sleep();
    
}

- (void)blockTest {
    NSString * (^run)(CGFloat meter) = ^NSString *(CGFloat meter) {
        NSLog(@"run %.2lf meter", meter);
        return @"cxz";
    };
    NSString *name = run(12.52);
    NSLog(@"name:%@", name);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
