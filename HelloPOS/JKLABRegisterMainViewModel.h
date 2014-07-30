//
//  JKLABRegisterMainViewModel.h
//  HelloPOS
//
//  Created by admin on 30/7/14.
//  Copyright (c) 2014 jklab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKLABRegisterMainViewModel : NSObject
@property(nonatomic, retain) NSMutableArray *productsInCart;
- (NSUInteger) numberOfProductsInCart;
- (CGFloat) checkoutPrice;
@end
