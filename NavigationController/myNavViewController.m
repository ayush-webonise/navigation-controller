//
//  myNavViewController.m
//  NavigationController
//
//  Created by webonise on 19/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "myNavViewController.h"
#import "ViewController.h"
#import "productDetailsViewController.h"

@implementation myNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addProducts)];
    self.navigationController.topViewController.navigationItem.rightBarButtonItem = item;
}

-(void) viewWillAppear:(BOOL)animated{
    [self addView];
}

-(void) addView{
     AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    int i,yPosition = 60;
    if([appDelegate.arrayProducts count]> 0)
    {
        for(i=0;i<[appDelegate.arrayProducts count];i++)
        {
            UIView *viewProductList = [[UIView alloc] initWithFrame:CGRectMake(0, yPosition, 400, 100)];
            viewProductList.backgroundColor = [UIColor grayColor];
            [self.view addSubview:viewProductList];
            UIButton *displayDetailsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            displayDetailsButton.frame = CGRectMake(0, yPosition, 400, 100);
            [displayDetailsButton setTitle:@"" forState:UIControlStateNormal];
            [displayDetailsButton setTag:i];
            [displayDetailsButton addTarget:self action:@selector(showProductDetails:) forControlEvents:UIControlEventTouchUpInside];
            UILabel *labelProductName = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 250, 40)];
            UILabel *labelProductPrice = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 250, 40)];
            labelProductName.text = [appDelegate.arrayProducts[i] productName];
            labelProductPrice.text = [appDelegate.arrayProducts[i] productPrice];
            [self.view addSubview:displayDetailsButton];
            [viewProductList addSubview:labelProductName];
            [viewProductList addSubview:labelProductPrice];
            yPosition = yPosition+110;
        }
    }

}


-(void)showProductDetails:(UIButton*) sender {
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    appDelegate.stringProductName = [appDelegate.arrayProducts[sender.tag] productName];
    appDelegate.stringProductPrice = [appDelegate.arrayProducts[sender.tag] productPrice];
    productDetailsViewController *productDetails = [self.storyboard instantiateViewControllerWithIdentifier:@"productDetailsViewController"];
    [self.navigationController pushViewController:productDetails animated:YES];
}

-(void)addProducts {
    NSLog(@"added");
    ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
