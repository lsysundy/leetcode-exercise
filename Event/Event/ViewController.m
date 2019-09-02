//
//  ViewController.m
//  Event
//
//  Created by 刘帅仪 on 2019/8/29.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"

@interface ViewController ()
{
    CustomButton *cornerButton;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cornerButton = [[CustomButton alloc] initWithFrame:CGRectMake(100, 100, 120, 120)];
    cornerButton.backgroundColor = [UIColor blueColor];
    [cornerButton addTarget:self action:@selector(doAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:cornerButton];
    
}

- (void)doAction: (UIButton *)button {
    NSLog(@"click");
}



@end
