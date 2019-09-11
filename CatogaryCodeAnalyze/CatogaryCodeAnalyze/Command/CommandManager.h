//
//  CommandManager.h
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/9.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommandManager : NSObject

//命令管理容器 存储正在执行的命令
@property (nonatomic, strong)NSMutableArray<Command *> *arrayCommonds;

//命令管理者以单例形式呈现
+ (instancetype)sharedInstance;

//执行命令
+ (void)executeCommand: (Command *)cmd completion: (CommandCompletionCallBack)completion;

//取消命令
+ (void)cancleCommand: (Command *)cmd;

@end

NS_ASSUME_NONNULL_END
