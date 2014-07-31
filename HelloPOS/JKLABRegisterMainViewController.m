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
#import "JKLABHelloGatewaySalesService.h"

@interface JKLABRegisterMainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *uiProductQuantityLabel;
@property (weak, nonatomic) IBOutlet UILabel *uiCheckoutPriceLabel;
@property (weak, nonatomic) IBOutlet UIView *uiLoadingIndicator;

@end

@implementation JKLABRegisterMainViewController

@synthesize model;

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


-(void)switchViewToLoadingMode
{
    self.view.userInteractionEnabled = NO;
    self.uiLoadingIndicator.hidden = NO;
}

-(void)switchViewToReadyMode
{
    self.view.userInteractionEnabled = YES;
    self.uiLoadingIndicator.hidden = YES;
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





// UI event handlers

- (IBAction)actionProcessSales:(id)sender {
    
    [self switchViewToLoadingMode];
    
    NSString *customerId = model.customerId;
    NSUInteger quantity = [model numberOfProductsInCart];
    CGFloat amount = [model checkoutPrice];
    
    if (customerId == nil) {
        UIAlertView *validationAlertView = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"Please select a customer" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [validationAlertView show];
        [self switchViewToReadyMode];
        return;
    }
    
    if (quantity < 1) {
        UIAlertView *validationAlertView = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"Please add a product" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [validationAlertView show];
        [self switchViewToReadyMode];
        return;
    }
    
    PMKPromise *promise = [JKLABHelloGatewaySalesService sendToGatewaySalesWithCustomerId:customerId Quantity:quantity Amount:amount];
    
    promise.then(^{
        
        UIAlertView *successAlertView = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Sales sent to gateway" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [successAlertView show];
        [model clearData];
        [self updateViewWithModel];
        
    }).catch(^(NSError *err){
        
        NSString *errorMessage = [NSString stringWithFormat:@"%@", err];
        UIAlertView *failureAlertView = [[UIAlertView alloc] initWithTitle:@"Failure" message:errorMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [failureAlertView show];
        NSLog(@"%@", errorMessage);
        
    }).finally(^{
        
        [self switchViewToReadyMode];
        
    });
    
}


- (IBAction)actionResetSales:(id)sender {
    [self.model clearData];
    [self updateViewWithModel];
}


- (IBAction)actionPushToQuickBooks:(id)sender {
    
    [self switchViewToLoadingMode];
    
    PMKPromise *promise = [JKLABHelloGatewaySalesService pushDataToQuickBooks];
    
    promise.then(^{
        
        UIAlertView *successAlertView = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Data successfully pushed to QuickBooks" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [successAlertView show];
        
    }).catch(^(NSError *err){
        
        NSString *errorMessage = [NSString stringWithFormat:@"%@", err];
        UIAlertView *failureAlertView = [[UIAlertView alloc] initWithTitle:@"Failure" message:errorMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [failureAlertView show];
        NSLog(@"%@", errorMessage);
        
    }).finally(^{
        
        [self switchViewToReadyMode];
        
    });
    
}

@end
