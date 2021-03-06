//
//  JKLABRoundRectButton.m
//  HelloPOS
//
//  Created by admin on 29/7/14.
//  Copyright (c) 2014 jklab. All rights reserved.
//

#import "JKLABRoundRectButton.h"

@implementation JKLABRoundRectButton

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
    
    UILabel *label = self.titleLabel;
    CGFloat labelFontSize = label.font.pointSize;
    UIFont *newFont = [UIFont fontWithName:@"Muli-Bold" size:labelFontSize];
    label.font = newFont;
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
