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
- (IBAction)fahrenheitValueChanged:(id)sender;
- (IBAction)celsiusValueEdited:(id)sender;

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
    
    self.celsiusTextField.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField methods

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {

    inputIsFahrenheit = NO;
    
    return YES;
}

#pragma mark - private methods


- (IBAction)celsiusValueEdited:(id)sender {
    inputIsFahrenheit = NO;
}

- (IBAction)fahrenheitValueChanged:(id)sender {
    inputIsFahrenheit = YES;
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
