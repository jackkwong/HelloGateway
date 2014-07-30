//
//  JKLABSelectCustomerTableViewController.h
//  HelloPOS
//
//  Created by abc on 31/7/14.
//  Copyright (c) 2014 jklab. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JKLABRegisterMainViewController.h"

@interface JKLABSelectCustomerTableViewController : UITableViewController
@property(nonatomic, retain) NSArray *customerData;
@property(nonatomic, retain) JKLABRegisterMainViewController *registerMainViewController;
@end
