//
//  RJInterfaceActionSeparatableSequenceView.m
//  RJiPhoneXAdaptDemo
//
//  Created by TouchWorld on 2020/11/30.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJInterfaceActionSeparatableSequenceView.h"
#import <Masonry/Masonry.h>

@interface RJInterfaceActionSeparatableSequenceView ()

@end

@implementation RJInterfaceActionSeparatableSequenceView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInit];
    }
        
    return self;
}

#pragma mark - Setup Init

- (void)setupInit {
    self.backgroundColor = [UIColor whiteColor];
    
    UIStackView *stackView = [[UIStackView alloc] init];
    [self addSubview:stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    stackView.backgroundColor = [UIColor systemPinkColor];
    
}

@end
