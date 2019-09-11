//
//  CommandManager.m
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/9.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "CommandManager.h"

@implementation CommandManager

+ (instancetype)sharedInstance {
    static CommandManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

- (id)copyWithZone: (nullable NSZone *)zone {
    return self;
}

+ (void)executeCommand:(Command *)cmd completion:(CommandCompletionCallBack)completion {
    if (cmd) {
        //如果命令正在执行不作处理，否则添加并执行命令
        if ([self _isExecuteCommand:cmd]) {
//            添加到命令容器中
            [[[self sharedInstance] arrayCommonds] addObject:cmd];
//            这是命令执行完成的回调
            cmd.completion = completion;
            [cmd execute];
        }
    }
}

+ (void)cancleCommand:(Command *)cmd {
    if (cmd) {
        [[[self sharedInstance] arrayCommonds] removeObject:cmd];
        [cmd cancle];
    }
}

+ (BOOL)_isExecuteCommand: (Command *)cmd {
    if (cmd) {
        NSArray *cmds = [[self sharedInstance] arrayCommonds];
        for (Command *aCmd in cmds) {
            //当前命令正在执行
            if (cmd == aCmd) {
                return YES;
            }
        }
    }
    return NO;
}



@end
