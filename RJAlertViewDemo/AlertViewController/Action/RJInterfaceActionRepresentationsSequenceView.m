//
//  RJInterfaceActionRepresentationsSequenceView.m
//  RJiPhoneXAdaptDemo
//
//  Created by TouchWorld on 2020/11/30.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJInterfaceActionRepresentationsSequenceView.h"
#import "RJInterfaceActionSeparatableSequenceView.h"
#import <Masonry/Masonry.h>
#import "RJAlertAction.h"
#import "RJAlertControllerActionViewConst.h"

@interface RJInterfaceActionRepresentationsSequenceView ()

/// <#Desription#>
@property (nonatomic, weak) RJInterfaceActionSeparatableSequenceView *sequenceView;

@end

@implementation RJInterfaceActionRepresentationsSequenceView

- (instancetype)initWithActions:(NSArray *)actions {
    self = [super init];
    if (self) {
        self.actions = actions;
        [self setupInit];
    }
    return self;
}

#pragma mark - Setup Init

- (void)setupInit {
    self.backgroundColor = [UIColor clearColor];
    self.bounces = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.layer.masksToBounds = YES;
    
    CGFloat contentHeight = [self calculateContentHeight];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(contentHeight);
    }];
    
    RJInterfaceActionSeparatableSequenceView *sequenceView = [[RJInterfaceActionSeparatableSequenceView alloc] initWithActions:self.actions];
    [self addSubview:sequenceView];
    [sequenceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(contentHeight);
    }];
    self.sequenceView = sequenceView;
}

- (CGFloat)calculateContentHeight {
    CGFloat contentHeight = 0.0;
    if (self.actions.count <= 2) {
        contentHeight = RJAlertControllerActionViewDefaultHeight;
        return contentHeight;
    }
    
    contentHeight += self.actions.count * RJAlertControllerActionViewDefaultHeight + (self.actions.count - 1) * RJAlertControllerSeparatorViewDefaultHeight;
    return contentHeight;
}

#pragma mark - Property

@end
