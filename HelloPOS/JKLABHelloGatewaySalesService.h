//
//  JKLABHelloGatewaySalesService.h
//  HelloPOS
//
//  Created by abc on 31/7/14.
//  Copyright (c) 2014 jklab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PromiseKit.h>

@interface JKLABHelloGatewaySalesService : NSObject

+(PMKPromise *) sendToGatewaySalesWithCustomerId:(NSString *)customerId Quantity:(NSUInteger)quantity Amount:(CGFloat)amount;
+(PMKPromise *) pushDataToQuickBooks;

@end
