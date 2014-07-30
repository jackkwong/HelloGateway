//
//  JKLABViewController.m
//  HelloPOS
//
//  Created by admin on 29/7/14.
//  Copyright (c) 2014 jklab. All rights reserved.
//

#import "JKLABRegisterMainViewController.h"
#import "JKLABProductViewController.h"
#import "JKLABSelectCustomerTableViewController.h"

@interface JKLABRegisterMainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *uiProductQuantityLabel;
@property (weak, nonatomic) IBOutlet UILabel *uiCheckoutPriceLabel;

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



- (void)updateViewWithModel
{
    self.uiProductQuantityLabel.text = [NSString stringWithFormat:@"Item: %d", self.model.numberOfProductsInCart];
    self.uiCheckoutPriceLabel.text = [NSString stringWithFormat:@"Total: $%.2f", self.model.checkoutPrice];
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
        
    }else if ([segue.identifier isEqualToString:@"SelectCustomer"]){
        
        NSArray *dummyCustomerData = @[
                                      
                                      @{@"id": @"5", @"name": @"Brad Lauster"},
                                      @{@"id": @"6", @"name": @"David Bozin"},
                                      @{@"id": @"4", @"name": @"Irene Chan"},
                                      @{@"id": @"3", @"name": @"Jason Ngan"},
                                      @{@"id": @"2", @"name": @"Jack Kwong"}
                                      
                                      ];
        
        JKLABSelectCustomerTableViewController *controller = segue.destinationViewController;
        controller.customerData = dummyCustomerData;
        controller.registerMainViewController = self;
    }
}


- (IBAction)actionProcessSales:(id)sender {
}
- (IBAction)actionResetSales:(id)sender {
    [self.model clearData];
    [self updateViewWithModel];
}
- (IBAction)actionPushToQuickBooks:(id)sender {
}

@end
