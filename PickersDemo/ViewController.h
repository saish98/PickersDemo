//
//  ViewController.h
//  PickersDemo
//
//  Created by Saish on 05/11/14.
//  Copyright (c) 2014 Saish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textFieldDatePicker;
@property (strong, nonatomic) IBOutlet UITextField *textFieldPicker;
@property (strong, nonatomic) IBOutlet UIView *viewPickerBackground;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
- (IBAction)buttonDone:(id)sender;
@end

