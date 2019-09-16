//
//  TestViewController.m
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/11.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "TestViewController.h"
#import "AdPopUps.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


+ (void)show {

    id<PopUpsProtocol> popUps = [AdPopUps new];
    popUps.url = @"...";
    popUps.content = @"...";
    popUps.type = @"...";
    [popUps execute];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
