//
//  TemperatureViewController.m
//  ItsHotInHere
//
//  Created by Bruno Parrinello on 1/12/14.
//  Copyright (c) 2014 Bruno Parrinello. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()
@property (strong, nonatomic) IBOutlet UITextField *fahrenheitTextField;
@property (strong, nonatomic) IBOutlet UITextField *celsiusTextField;
@property (strong, nonatomic) IBOutlet UIButton *convertButton;

- (IBAction)buttonPressed:(id)sender;
//- (IBAction)celsiusEditingDidBegin:(id)sender;
//- (IBAction)fahrenheitEditingDidBegin:(id)sender;

- (float)celsiusToFahrenheit:(float)celsiusValue;
- (float)fahrenheitToCelsius:(float)fahrenheitValue;

@end

@implementation TemperatureViewController

BOOL inputIsFahrenheit = YES;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // Prompt the Fahrenheit text field, which brings up the keyboard.
    [self.fahrenheitTextField becomeFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
//
//- (IBAction)celsiusEditingDidBegin:(id)sender {
//    inputIsFahrenheit = NO;
//}
//
//- (IBAction)fahrenheitEditingDidBegin:(id)sender {
//    inputIsFahrenheit = YES;
//}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (textField == self.celsiusTextField) {
        inputIsFahrenheit = NO;
    } else if (textField == self.fahrenheitTextField) {
        inputIsFahrenheit = YES;
    }
    
    return YES;
}


- (IBAction)buttonPressed:(id)sender {
    float fahrenheitValue = [self.fahrenheitTextField.text floatValue];
    float celsiusValue = [self.celsiusTextField.text floatValue];
    
    if (inputIsFahrenheit) {
        self.celsiusTextField.text = self.fahrenheitTextField.hasText ? [NSString stringWithFormat:@"%0.2f",[self fahrenheitToCelsius:fahrenheitValue]] : @"";
    } else {
        self.fahrenheitTextField.text = self.celsiusTextField.hasText ? [NSString stringWithFormat:@"%0.2f",[self celsiusToFahrenheit:celsiusValue]] : @"";
    }

    [self.view endEditing:YES];
    
}


- (float)celsiusToFahrenheit:(float)celsiusValue {
    
    return ((celsiusValue*9/5) + 32);
}

- (float)fahrenheitToCelsius:(float)fahrenheitValue {
    
    return ((fahrenheitValue - 32)*5/9);
}

@end
