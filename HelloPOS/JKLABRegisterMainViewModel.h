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
@property(nonatomic, retain) NSString *customerId;
- (NSUInteger) numberOfProductsInCart;
- (CGFloat) checkoutPrice;

- (void) clearData;
@end
