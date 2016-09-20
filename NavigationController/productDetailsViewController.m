//
//  productDetailsViewController.m
//  NavigationController
//
//  Created by webonise on 20/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "productDetailsViewController.h"

@implementation productDetailsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self displayParticularProductDetails];
}

-(void) displayParticularProductDetails{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    labelProductName.text = appDelegate.stringProductName;
    labelProductPrice.text = appDelegate.stringProductPrice;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end