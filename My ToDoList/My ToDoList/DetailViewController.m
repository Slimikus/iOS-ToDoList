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
    
    [self.buttonSave addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer * handTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handlerEndEditin)];
    
    [self.view addGestureRecognizer:handTap];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) handlerEndEditin {
    
    [self.view endEditing:YES];

    
    
}

- (void) save {
    
    NSLog(@"save");
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:self.textField]) {
    [self.textField resignFirstResponder];
    }
    
    
    return YES;
}


@end
