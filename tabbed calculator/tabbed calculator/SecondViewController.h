//
//  SecondViewController.h
//  tabbed calculator
//
//  Created by Tyson Walton on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
{
    
    UITextField *inputText;
    UITextField *decimalOutputText;
    UITextField *integerOutputText;
    
}


@property (nonatomic, retain) IBOutlet UITextField *inputText;
@property (nonatomic, retain) IBOutlet UITextField *decimalOutputText;
@property (nonatomic, retain) IBOutlet UITextField *integerOutputText;


-(IBAction)quickConvert:(id)sender;


@end
