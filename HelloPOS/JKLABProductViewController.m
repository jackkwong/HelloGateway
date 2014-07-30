//
//  JKLABProductViewController.m
//  HelloPOS
//
//  Created by admin on 29/7/14.
//  Copyright (c) 2014 jklab. All rights reserved.
//

#import "JKLABProductViewController.h"
#import "JKLABProductCell.h"

@interface JKLABProductViewController ()

@end

@implementation JKLABProductViewController

@synthesize productData;
@synthesize registerMainViewController;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger i = indexPath.row;
    NSUInteger numberOfProductsInCurrentPage = productData.count;
    NSUInteger lastProductIndex = numberOfProductsInCurrentPage - 1;
    
    if (i > lastProductIndex ) {
        UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"EmptyCell" forIndexPath:indexPath];
        return cell;
    }
    
    NSDictionary *product = productData[i];
    
    JKLABProductCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"ProductCell" forIndexPath:indexPath];
    cell.uiProductImageView.image = [UIImage imageNamed:product[@"image"] ];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}






- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger i = indexPath.row;
    NSUInteger numberOfProductsInCurrentPage = productData.count;
    NSUInteger lastProductIndex = numberOfProductsInCurrentPage - 1;
    
    if (i > lastProductIndex ) {
        return;
    }
    
    NSDictionary *product = productData[i];
    
    NSLog(@"%@", product);
    [self.registerMainViewController.model.productsInCart addObject:product];
    NSLog(@"%f", [self.registerMainViewController.model checkoutPrice]);
    NSLog(@"%d", self.registerMainViewController.model.numberOfProductsInCart);
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
