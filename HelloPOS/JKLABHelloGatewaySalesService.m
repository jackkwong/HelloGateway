//
//  JKLABHelloGatewaySalesService.m
//  HelloPOS
//
//  Created by abc on 31/7/14.
//  Copyright (c) 2014 jklab. All rights reserved.
//

#import "JKLABHelloGatewaySalesService.h"
#import <PromiseKit.h>
#import <PromiseKit+Foundation.h>

static NSString *GATEWAY_HOST = @"http://hellogateway.herokuapp.com";

@implementation JKLABHelloGatewaySalesService

+(PMKPromise *) sendToGatewaySalesWithCustomerId:(NSString *)customerId Quantity:(NSUInteger)quantity Amount:(CGFloat)amount
{
    NSString *url = [NSString stringWithFormat:@"%@/api/v1/sales.json", GATEWAY_HOST];
    NSDictionary *parameters = @{
                                 @"sale[customer_id]": customerId,
                                 @"sale[total_quantity]": [NSNumber numberWithUnsignedInteger:quantity],
                                 @"sale[amount]": [NSNumber numberWithFloat:amount]
                                 };
    PMKPromise *promise = [NSURLConnection POST:url formURLEncodedParameters:parameters];
    return promise;
}

+ (PMKPromise *)pushDataToQuickBooks
{
    NSString *url = [NSString stringWithFormat:@"%@/api/v1/sales/flush.json", GATEWAY_HOST];
    PMKPromise *promise = [NSURLConnection GET:url];
    return promise;
}

@end
