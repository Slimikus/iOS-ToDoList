//
//  ViewController.m
//  My ToDoList
//
//  Created by Admin on 01.02.16.
//  Copyright © 2016 Slimikus. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIDatePicker *dataPicker;

@property (weak, nonatomic) IBOutlet UIButton *buttonSave;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.buttonSave addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) save {
    
    NSLog(@"save");
    
}

@end
