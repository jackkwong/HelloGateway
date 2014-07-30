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
@synthesize customerId;

- (id)init
{
    self = [super init];
    
    if (self) {
        [self clearData];
    }
    
    return self;
}

- (NSUInteger)numberOfProductsInCart
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

- (void)clearData
{
    productsInCart = @[].mutableCopy;
    customerId = nil;
}

@end
