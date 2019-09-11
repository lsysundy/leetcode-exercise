//
//  SingleInstance.m
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/9.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "SingleInstance.h"

@implementation SingleInstance

+ (id)sharedInstance {
    static SingleInstance *single = nil;
    //通过dispatch_once方式 确保single再多线程环境下只被创建一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //创建实例
        single = [[super allocWithZone:NULL] init];
    });
    return single;
}

//重写方法【必不可少】因为不通过sharedInstance创建对象也可以，为了规避sharedInstance不被主动调用，所以要重写
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

//重写方法【必不可少】因为外界可能通过当前实例做copy操作，所以要重写
- (id)copyWithZone: (nullable NSZone *)zone {
    return self;
}

@end
