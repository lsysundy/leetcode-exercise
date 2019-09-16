//
//  ViewController.m
//  ExploreLayout
//
//  Created by 刘帅仪 on 2019/9/12.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@property (nonatomic, strong) TestView *tView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //不设置frame会调用layoutSubviews
//    TestView *tView = [TestView new];
//    [self.view addSubview:tView];
    
    //当view是一个局部变量时，设置frame为CGReactZero，调用一次
//    TestView *tView1 = [[TestView alloc] initWithFrame:CGRectZero];
//    [self.view addSubview:tView1];
    
    //当view是VC的成员变量时，设置frame调用两次layoutSubviews
    self.tView = [[TestView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:self.tView];
    self.tView.backgroundColor = [UIColor yellowColor];
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = CGRectMake(200, 200, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(click) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
    UILabel *label = [UILabel new];
    [self.view addSubview:label];
    
    //会计算出最优的size，但不会改变自身的size，label自适应大小
    [label sizeThatFits:CGSizeMake(80, 80)];
    //会计算最优的size并且会改变自身的size
    [label sizeToFit];
    
    
}


/**
    layoutIfNeeded：使用约束的布局时，调用后立即更新
    setNeedsLayout：不会立即刷新
    setNeedsDisplay：调用时会自动调用drawRect，drawRect只要用来绘制显示位图的
    刷新布局时用：setNeedsLayout
    重绘时用：setNeedsDisplay
 */
- (void)click {
    //view的frame不改变不调用layoutSubviews
    self.tView.frame = CGRectMake(0, 0, 100, 100);
    
}




@end
