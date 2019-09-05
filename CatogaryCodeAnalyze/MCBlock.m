//
//  file.m
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/4.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "MCBlock.h"

//全局变量
int global_var = 4;

//静态全局变量
static int static_global_var = 5;

@implementation MCBlock

- (void)method {
    //基本数据类型的局部变量
    int var = 6;
    
    //    对象类型的局部变量
    __unsafe_unretained id unsafe_obj = nil;
    __strong id strong_obj = nil;
    
    //    局部静态变量
    static int static_var = 3;
    
    
    void(^Block)(void) = ^(void){
        NSLog(@"局部变量<基本数据类型> var %d \n", var);
        NSLog(@"局部变量<__unsafe_unretained 对象类型> var %@ \n", unsafe_obj);
        NSLog(@"局部变量<__strong 对象类型> var %@ \n", strong_obj);

        NSLog(@"局部静态变量 %d \n", static_var);

        NSLog(@"全局变量 %d \n", global_var);
        NSLog(@"静态全局变量 %d \n", static_global_var);
    };
    
    Block();
    
    
}

- (void)method_1 {
//    int multiplier = 6;
//    static int multiplier = 6;
    __block int multiplier = 6;
    int (^Block)(int) = ^int(int num) {
        return num * multiplier;
    };
    multiplier = 4;
    NSLog(@"result is %d", Block(2));

}




@end
