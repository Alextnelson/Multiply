//
//  ViewController.m
//  Multiply
//
//  Created by Alexander Nelson on 1/19/16.
//  Copyright © 2016 218 Apps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;

@property NSArray *sliderNumbers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(IBAction)sliderValueChanged:(id)sender {
    float valueFloat = self.slider.value;
    int valueInt = (int)valueFloat;
    self.multiplierLabel.text = [NSString stringWithFormat:@"%i", valueInt];
}


- (IBAction)onCalculateButtonPressed:(id)sender {
    int x = [self.numberTextField.text intValue];
    int y = [self.multiplierLabel.text intValue];
    int result;

    if (self.operatorSegmentControl.selectedSegmentIndex == 0) {
        result = x * y;
    } else if (self.operatorSegmentControl.selectedSegmentIndex == 1) {
        result = x/y;
    }

    if (result >= 20) {
        self.view.backgroundColor = [UIColor greenColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }

    if (result % 3 == 0 && result % 5 == 0) {
        self.answerLabel.text = @"Fizzbuzz";
    } else if (result % 3 == 0) {
        self.answerLabel.text = @"Fizz";
    } else if (result % 5 == 0) {
        self.answerLabel.text = @"Buzz";
    } else {
        self.answerLabel.text = [NSString stringWithFormat:@"%i", result];
    }
    [self resignFirstResponder];
}


@end
