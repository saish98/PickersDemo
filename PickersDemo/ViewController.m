//
//  ViewController.m
//  PickersDemo
//
//  Created by Saish on 05/11/14.
//  Copyright (c) 2014 Saish. All rights reserved.
//

#import "ViewController.h"

@interface ViewController  (){
    NSDateFormatter *formatter;
    NSArray *arrayData;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    
    arrayData = @[@"First",@"Second",@"Third",@"Forth",@"Fifth"];
}
-(void)viewWillAppear:(BOOL)animated{
    [self initializeTextFieldInputView];
    
}
- (void) initializeTextFieldInputView {
    self.datePicker.backgroundColor = [UIColor whiteColor];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.pickerView.backgroundColor =[UIColor whiteColor];
    [self.datePicker addTarget:self action:@selector(dateUpdated:) forControlEvents:UIControlEventValueChanged];
    self.textFieldDatePicker.inputView = self.viewPickerBackground;
    self.textFieldPicker.inputView = self.viewPickerBackground;
    [self.viewPickerBackground removeFromSuperview];
    self.pickerView.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Textfield Delegate

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField == self.textFieldDatePicker) {
        self.datePicker.hidden = false;
        self.pickerView.hidden = true;
    }else if (textField == self.textFieldPicker){
        self.datePicker.hidden = true;
        self.pickerView.hidden = false;
    }
    
    return true;
}
- (void) dateUpdated:(UIDatePicker *)datePicker {
    
    self.textFieldDatePicker.text = [formatter stringFromDate:self.datePicker.date];
}
- (IBAction)buttonDone:(id)sender {
    [self.view endEditing:YES];
}

#pragma mark - PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.textFieldPicker.text = arrayData [row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [arrayData count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return arrayData[row];
}

@end