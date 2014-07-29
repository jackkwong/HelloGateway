//
//  JKLABPaginationSegmentedControl.m
//  HelloPOS
//
//  Created by admin on 29/7/14.
//  Copyright (c) 2014 jklab. All rights reserved.
//

#import "JKLABPaginationSegmentedControl.h"

@implementation JKLABPaginationSegmentedControl

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
    
    NSDictionary *titleTextAttributes = @{
        NSForegroundColorAttributeName: [UIColor blackColor],
        NSFontAttributeName: [UIFont systemFontOfSize:22]
    };
    
    NSDictionary *selectedTitleTextAttributes = @{
        NSForegroundColorAttributeName: [UIColor whiteColor]/*,
        NSBackgroundColorAttributeName: [UIColor colorWithRed:(45/255.0) green:(172/255.0) blue:(227/255.0) alpha:1]*/
    };
    
    [self setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    [self setTitleTextAttributes:selectedTitleTextAttributes forState:UIControlStateSelected];
    
    self.tintColor = [UIColor colorWithRed:(45/255.0) green:(172/255.0) blue:(227/255.0) alpha:1];
    
    CALayer *layer = self.layer;
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    layer.cornerRadius = 5;
    
    layer.shadowOffset = CGSizeMake(0, 1);
    layer.shadowRadius = 0;
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOpacity = 0.1;
    

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
