//
//  SecondViewController.m
//  tabbed calculator
//
//  Created by Tyson Walton on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize inputText;
@synthesize decimalOutputText;
@synthesize integerOutputText;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(IBAction)quickConvert:(id)sender
{   
    UIButton *buttonInfo;
    buttonInfo = (UIButton *)sender;
    NSLog(@" sender.tag = %d", buttonInfo.tag);
    
    if (buttonInfo.tag == 24) {
        // Decimal Button was clicked  
        float outputVal = [inputText.text floatValue];
        integerOutputText.text = nil;
        NSLog(@"outputVal = %f", outputVal);
        decimalOutputText.text = [NSString stringWithFormat:@"%.4f", outputVal];
        
    }
    if (buttonInfo.tag == 25) {
        // Integer buttonClicked
        
        int outputVal = (int)[inputText.text floatValue];
        decimalOutputText.text = nil;
        NSLog(@"outputVal = %d", outputVal);
        integerOutputText.text = [NSString stringWithFormat:@"%i", outputVal];
        
    }
}

@end
