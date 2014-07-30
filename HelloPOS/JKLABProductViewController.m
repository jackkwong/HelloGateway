//
//  JKLABProductViewController.m
//  HelloPOS
//
//  Created by admin on 29/7/14.
//  Copyright (c) 2014 jklab. All rights reserved.
//

#import "JKLABProductViewController.h"
#import "JKLABProductCell.h"


static NSArray *PRODUCT_DATA;


@interface JKLABProductViewController ()

@end

@implementation JKLABProductViewController

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
    [self initData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)initData
{
    PRODUCT_DATA = @[
                     
                     @{@"image": @"sample_product_icon1", @"price": @46.5},
                     @{@"image": @"sample_product_icon2", @"price": @61.2},
                     @{@"image": @"sample_product_icon3", @"price": @200},
                     @{@"image": @"sample_product_icon4", @"price": @99.9}
                     
                     ];
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger i = indexPath.row;
    NSUInteger numberOfProductsInCurrentPage = PRODUCT_DATA.count;
    NSUInteger lastProductIndex = numberOfProductsInCurrentPage - 1;
    
    if (i > lastProductIndex ) {
        UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"EmptyCell" forIndexPath:indexPath];
        return cell;
    }
    
    NSDictionary *product = PRODUCT_DATA[i];
    
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
