//
//  ViewController.m
//  My ToDoList
//
//  Created by Admin on 01.02.16.
//  Copyright © 2016 Slimikus. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIDatePicker *dataPicker;
@property (weak, nonatomic) IBOutlet UIButton *buttonSave;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.isDetail) {
        
        self.textField.text = self.eventInfo;
        self.textField.userInteractionEnabled = NO;
        self.dataPicker.userInteractionEnabled = NO;
        self.buttonSave.alpha = 0;
        
        [self performSelector:@selector(setDatePickerValueWithAnimation) withObject:nil afterDelay:0.5];
        
    } else {
    
    self.buttonSave.userInteractionEnabled = NO;
    self.dataPicker.minimumDate = [NSDate date];
    
    [self.dataPicker addTarget:self action:@selector(datePickerValueChanged) forControlEvents:UIControlEventValueChanged];
    
    [self.buttonSave addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer * handTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handlerEndEditin)];
    
    [self.view addGestureRecognizer:handTap];
        
    }
    
}

- (void) setDatePickerValueWithAnimation {
    
    [self.dataPicker setDate:self.eventDate animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) datePickerValueChanged {
    
    self.eventDate = self.dataPicker.date;
    NSLog(@"self.eventdate %@", self.eventDate);
}

- (void) handlerEndEditin {
 
         if ([self.textField.text length] != 0) {
            [self.view endEditing:YES];
            self.buttonSave.userInteractionEnabled = YES;
        } else {
            [self showAlertWithMessage:@"Для сохранения события введите значение в текстовое поле"];
        }
        
    }


- (void) save {
    
    if (self.eventDate) {
        
        if ([self.eventDate compare:[NSDate date]] == NSOrderedSame) {
            [self showAlertWithMessage:@"Для будущего события не может быть совпадать с текущей датой"];
            
        } else if ([self.eventDate compare:[NSDate date]] == NSOrderedAscending) {
            [self showAlertWithMessage:@"Для будущего события не может быть ранее текущей даты"];
            
        } else {
            [self setNotification];
        }
        
    } else {
        [self showAlertWithMessage:@"Для сохранения события измените значение даты на более позднее"];
    }
    
}

- (void) setNotification {
    
    NSString * eventInfo = self.textField.text;
    NSDateFormatter * formater = [[NSDateFormatter alloc] init];
    formater.dateFormat = @"HH:mm dd.MMMM.yyyy";
    
    NSString * eventDate = [formater stringFromDate:self.eventDate];
    
    NSDictionary * dict = [[NSDictionary alloc] initWithObjectsAndKeys:eventInfo, @"eventInfo", eventDate, @"eventDate", nil];
    
    UILocalNotification * notification = [[UILocalNotification alloc] init];
    notification.userInfo = dict;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.fireDate = self.eventDate;
    notification.alertBody = eventInfo;
    notification.applicationIconBadgeNumber = 1;
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NewEvent" object:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:self.textField]) {
        if ([self.textField.text length] != 0) {
            [self.textField resignFirstResponder];
            self.buttonSave.userInteractionEnabled = YES;
            return YES;
        } else {
            [self showAlertWithMessage:@"Для сохранения события введите значение в текстовое поле"];
        }
        
    }
    return NO;
}

- (void) showAlertWithMessage : (NSString *) message {
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Внимание!" message: message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
