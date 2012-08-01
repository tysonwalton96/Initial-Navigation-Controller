//
//  FirstViewController.m
//  tabbed calculator
//
//  Created by Tyson Walton on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()


@end

@implementation FirstViewController


@synthesize operatorPressed;
@synthesize calculatorDisplay;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"multi-calculator"];
    }
    return self;
}



- (void)viewDidLoad
{isFirstInputAfterOP = TRUE;
    isOperatorPressed = FALSE;
    isDecimalPressed = FALSE;
    didKalaniUpdateInputNumber1 = FALSE; 
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

-(IBAction)operatorFunction: (id)sender
{
    UIButton *buttonInfo;
    buttonInfo = (UIButton *)sender;
    NSLog(@" sender.tag = %d", buttonInfo.tag);
    
    if (buttonInfo.tag == 26) 
    {
        // division sign was pressed
        operatorPressed = @"/";
    }
    
    if (buttonInfo.tag == 27)
    {
        // multiply button was pushed
        operatorPressed = @"*";
    }
    
    if (buttonInfo.tag == 28)
    {
        // minus button was pushed
        operatorPressed = @"-";
    }
    
    if (buttonInfo.tag == 29)
    {
        // plus button was pushed
        operatorPressed = @"+";
        
    }
    if (buttonInfo.tag == 20)
    {
        // radical button was pushed
        operatorPressed = @"%";
    }
    
    isOperatorPressed = TRUE;
    
}




-(IBAction)calculate:(id)sender
{
    NSLog(@"calculate function called" );
    NSLog(@"is operator pressed = %d", isOperatorPressed);
    NSLog(@"operator pressed = %@",operatorPressed);
    
    if (isOperatorPressed && operatorPressed == @"-"){
        calculatedResult = inputNumber1 - inputNumber2;
        calculatorDisplay.text = [NSString  stringWithFormat:@"%f", calculatedResult];
    } 
    
    if(isOperatorPressed && operatorPressed == @"+") {
        calculatedResult = inputNumber1 + inputNumber2;
        calculatorDisplay.text = [NSString stringWithFormat:@"%f", calculatedResult];
        
    }
    
    
    if(isOperatorPressed && operatorPressed == @"*") {
        calculatedResult = inputNumber1 * inputNumber2;
        calculatorDisplay.text = [NSString stringWithFormat:@"%f", calculatedResult];
        
    }
    
    if( isOperatorPressed && operatorPressed == @"/") {
        calculatedResult = inputNumber1 / inputNumber2;
        calculatorDisplay.text = [NSString stringWithFormat:@"%f", calculatedResult];
    }
    
    inputNumber2 = 0;
    inputNumber1 = calculatedResult;
    isOperatorPressed = FALSE;
    isDecimalPressed = FALSE;
    isFirstInputAfterOP = TRUE;
    didKalaniUpdateInputNumber1 = TRUE;
    
}



-(IBAction)numberPressed:(id)sender
{
    NSString *originalText;
    NSString *outputText;
    UIButton *buttonPressed = (UIButton *)sender;
    
    if (isFirstInputAfterOP && isOperatorPressed) {
        calculatorDisplay.text = @"";
        isFirstInputAfterOP = FALSE;
    }
    if(didKalaniUpdateInputNumber1){
        didKalaniUpdateInputNumber1 = FALSE; 
        originalText = calculatorDisplay.text = @"";
        
    } else {
        originalText = calculatorDisplay.text;
        
    }
    
    
    
    if (buttonPressed.tag == 10)
    {
        if (isDecimalPressed) {
            outputText = originalText;
        } else {
            outputText = [NSString stringWithFormat:@"%@.", originalText];    
            isDecimalPressed = TRUE;
        }
        
    } else {
        outputText = [NSString stringWithFormat:@"%@%d", originalText, buttonPressed.tag];    
    }
    
    NSLog(@"Number Pressed Called");
    NSLog(@"Number Pressed = %d", buttonPressed.tag);
    NSLog(@"outpuText = %@", outputText);
    
    if (isOperatorPressed) { 
        
        inputNumber2 = [outputText doubleValue];
    } else {
        
        inputNumber1 = [outputText doubleValue];
        
        
    }
    calculatorDisplay.text = outputText;
    
}





//   clearScreen/ Clears the screen.
-(IBAction)clearScreen:(id)sender 
{    
    inputNumber1 = 0;
    inputNumber2 = 0;
    calculatedResult = 0;
    operatorPressed = @"";
    calculatorDisplay.text = @"";
    isOperatorPressed = FALSE;
    isDecimalPressed = FALSE;
    isFirstInputAfterOP = TRUE;
    
}




// changes input number to negative or positve
-(IBAction)negativePositive:(id)sender
{
    double output;
    
    output = [calculatorDisplay.text doubleValue];
    output = output * -1;
    
    if(isOperatorPressed)
    {
        inputNumber2 = output;
    }
    else {
        inputNumber1 = output;
    }
    
    calculatorDisplay.text = [NSString stringWithFormat:@"%f", output];
}


@end
