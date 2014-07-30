//
//  JKLABProductImageView.m
//  HelloPOS
//
//  Created by admin on 30/7/14.
//  Copyright (c) 2014 jklab. All rights reserved.
//

#import "JKLABProductImageView.h"

@implementation JKLABProductImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self customizeAppearance];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self customizeAppearance];
    }
    return self;
}

- (void)customizeAppearance
{
    CALayer *layer = self.layer;
    layer.cornerRadius = 3;
    
    layer.shadowOffset = CGSizeMake(1, 2);
    layer.shadowOpacity = 1;
    layer.shadowRadius = 0;
    layer.shadowColor = [UIColor colorWithRed:(230/255.0) green:(230/255.0) blue:(230/255.0) alpha:1].CGColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
