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

@implementation RJInterfaceActionRepresentationsSequenceView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInit];
    }
        
    return self;
}

#pragma mark - Setup Init

- (void)setupInit {
    self.bounces = NO;
    self.showsHorizontalScrollIndicator = NO;
    
    RJInterfaceActionSeparatableSequenceView *sequenceView = [[RJInterfaceActionSeparatableSequenceView alloc] init];
    [self addSubview:sequenceView];
    [sequenceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(self);
    }];
    sequenceView.backgroundColor = [UIColor purpleColor];
}

@end
