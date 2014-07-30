//
//  JKLABProductViewController.h
//  HelloPOS
//
//  Created by admin on 29/7/14.
//  Copyright (c) 2014 jklab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKLABRegisterMainViewController.h"

@interface JKLABProductViewController : UICollectionViewController<UICollectionViewDataSource>
@property(nonatomic, retain) NSArray *productData;
@property(nonatomic, retain) JKLABRegisterMainViewController *registerMainViewController;
@end
