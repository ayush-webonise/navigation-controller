//
//  AppDelegate.h
//  NavigationController
//
//  Created by webonise on 19/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UIViewController *viewController;
@property (readwrite) NSMutableArray *arrayProducts;
@property (strong, nonatomic) NSString *stringProductName;
@property (strong, nonatomic) NSString *stringProductPrice;
@end

