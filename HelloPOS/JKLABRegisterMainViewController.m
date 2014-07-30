//
//  JKLABViewController.m
//  HelloPOS
//
//  Created by admin on 29/7/14.
//  Copyright (c) 2014 jklab. All rights reserved.
//

#import "JKLABRegisterMainViewController.h"
#import "JKLABProductViewController.h"

@interface JKLABRegisterMainViewController ()

@end

@implementation JKLABRegisterMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.model = [[JKLABRegisterMainViewModel alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"EmbedProduct"]) {
        
        NSArray *dummyProductData = @[
                                                         
                                     @{@"image": @"sample_product_icon1", @"price": @46.5},
                                     @{@"image": @"sample_product_icon2", @"price": @61.2},
                                     @{@"image": @"sample_product_icon3", @"price": @200},
                                     @{@"image": @"sample_product_icon4", @"price": @99.9}
                                     
                                     ];
        
        JKLABProductViewController *controller = segue.destinationViewController;
        controller.productData = dummyProductData;
        controller.registerMainViewController = self;
        
    }
}

@end
