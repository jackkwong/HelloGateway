//
//  JKLABRegisterMainViewModel.m
//  HelloPOS
//
//  Created by admin on 30/7/14.
//  Copyright (c) 2014 jklab. All rights reserved.
//

#import "JKLABRegisterMainViewModel.h"

@implementation JKLABRegisterMainViewModel
@synthesize productsInCart;

- (id)init
{
    self = [super init];
    
    if (self) {
        self.productsInCart = @[].mutableCopy;
    }
    
    return self;
}

- (CGFloat)numberOfProductsInCart
{
    return productsInCart.count;
}

- (CGFloat)checkoutPrice
{
    CGFloat totalPrice = 0;
    
    for (NSDictionary *product in productsInCart) {
        NSNumber *productPrice = product[@"price"];
        totalPrice += productPrice.floatValue;
    }
    
    return totalPrice;
}

@end
