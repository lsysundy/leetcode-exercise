//
//  TestView.m
//  ExploreLayout
//
//  Created by 刘帅仪 on 2019/9/12.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "TestView.h"

@implementation TestView

//旋转屏幕、addSubview都会调用
- (void)layoutSubviews {
    NSLog(@"来了");
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
