//
//  HProgressView.m
//  Time
//
//  Created by figaro on 16/4/18.
//  Copyright © 2016年 figaro. All rights reserved.
//

#import "HProgressView.h"

@interface HProgressView ()
{
    UIView * backView;
    UIView * frontView;
    BOOL isUpdating;
}

@end

@implementation HProgressView

-(instancetype)init{
    if (self = [super init]) {
        [self initUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    backView = [[UIView alloc] init];
    frontView = [[UIView alloc] init];
    [backView setBackgroundColor:[UIColor redColor]];
    [frontView setBackgroundColor:[UIColor blueColor]];
    
    self.layer.cornerRadius = 10.0;
    self.layer.masksToBounds = true;
    
    frontView.layer.cornerRadius = 10.0;
    frontView.layer.masksToBounds = true;
    
    [self addSubview:backView];
    [self addSubview:frontView];
    isUpdating = false;
}

//value 0 - 1
-(void)udateProgress:(CGFloat)value{
    if (isUpdating) {
        return;
    }
    isUpdating = true;
    value = value < 0 ? 0 : value;
    value = value > 1 ? 1 : value;
    CGRect frame = self.frame;
    frame.size.width *= value;
    [UIView animateWithDuration:0.35 animations:^{
        [frontView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    } completion:^(BOOL finished) {
        isUpdating = false;
    }];
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGRect frame = self.frame;
    
    frame.size.height = 20;
    self.frame = frame;
    
    [backView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    if (!isUpdating) {
        [frontView setFrame:CGRectMake(0, 0, 0, frame.size.height)];
    }
    
}


@end
