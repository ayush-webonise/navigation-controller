//
//  ViewController.m
//  Objective_C_Classes
//
//  Created by ayush mahajan on 17/09/16.
//  Copyright © 2016 ayush mahajan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    IBOutlet UITextField *textFieldProductCategory;
    IBOutlet UITextField *textFieldProductPrice;
    IBOutlet UITextField *textFieldProductName;
    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    }

-(BOOL) isValid:(NSString*)isValidString
{
    if([isValidString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

/** This function checks for validations whether the user has added only whitespaces in the text field
 * \returns Returns YES if the names and prices are added correctly else returns NO
 */
- (void)checkValidation
{
    if(![self isValid:textFieldProductName.text])
    {
        [textFieldProductName becomeFirstResponder];
    }
    else if(![self isValid:textFieldProductPrice.text])
    {
        [textFieldProductPrice becomeFirstResponder];
    }
    else if (![self isValid:textFieldProductCategory.text])
    {
        [textFieldProductCategory becomeFirstResponder];
    }
    else{
        [self addProduct];
    }
}

/** Function clears all the three text fields upon calling
 * \returns Returns nothing
 */
-(void) clearTextFields{
    textFieldProductName.text= @"";
    textFieldProductPrice.text = @"";
    textFieldProductCategory.text = @"";
}


-(void)addProduct
{
        Products *objectProducts = [[Products alloc]init];
        [objectProducts setProductName:textFieldProductName.text];
        [objectProducts setProductPrice:textFieldProductPrice.text];
        [objectProducts setProductCategory:textFieldProductCategory.text];
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        [appDelegate.arrayProducts addObject:objectProducts];
        for(objectProducts in appDelegate.arrayProducts)
        {
            NSLog(@"Product Name is:%@",objectProducts.productName);
            NSLog(@"Product Price is:%@",objectProducts.productPrice);
            NSLog(@"Product Category is:%@",objectProducts.productCategory);
        }
        [self clearTextFields];
        [textFieldProductName becomeFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}

/** It performs action when ADD button is pressed. Calls checkValidation method and UIAlertView
 * \param sender ID of ADD button
 */

- (IBAction)buttonAddPressed:(id)sender {
    [self checkValidation];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
