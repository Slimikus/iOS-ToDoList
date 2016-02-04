//
//  ViewController.h
//  My ToDoList
//
//  Created by Admin on 01.02.16.
//  Copyright © 2016 Slimikus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController


@property (nonatomic, strong) NSDate * eventDate;
@property (nonatomic, strong) NSString * eventInfo;
@property (nonatomic, assign) BOOL isDetail;

@end

