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
#import "RJAlertControllerActionItem.h"
#import "RJAlertControllerActionViewConst.h"

@interface RJInterfaceActionRepresentationsSequenceView ()

/// <#Desription#>
@property (nonatomic, weak) RJInterfaceActionSeparatableSequenceView *sequenceView;

@end

@implementation RJInterfaceActionRepresentationsSequenceView

- (instancetype)initWithActionItems:(NSArray *)actionItems {
    self = [super init];
    if (self) {
        self.actionItems = actionItems;
        [self setupInit];
    }
    return self;
}

#pragma mark - Setup Init

- (void)setupInit {
    self.bounces = NO;
    self.showsHorizontalScrollIndicator = NO;
    CGFloat contentHeight = [self calculateContentHeight];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(contentHeight);
    }];
    
    RJInterfaceActionSeparatableSequenceView *sequenceView = [[RJInterfaceActionSeparatableSequenceView alloc] initWithActionItems:self.actionItems];
    [self addSubview:sequenceView];
    [sequenceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(contentHeight);
    }];
    self.sequenceView = sequenceView;
    sequenceView.backgroundColor = [UIColor purpleColor];
}

- (CGFloat)calculateContentHeight {
    CGFloat contentHeight = 0.0;
    if (self.actionItems.count <= 2) {
        contentHeight = RJAlertControllerActionViewDefaultHeight;
        return contentHeight;
    }
    
    contentHeight += self.actionItems.count * RJAlertControllerActionViewDefaultHeight + (self.actionItems.count - 1) * RJAlertControllerSeparatorViewDefaultHeight;
    return contentHeight;
}

#pragma mark - Property

@end
