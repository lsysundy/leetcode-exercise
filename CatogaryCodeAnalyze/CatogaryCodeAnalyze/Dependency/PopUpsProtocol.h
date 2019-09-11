//
//  PopUpsProtocol.h
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/11.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@ protocol PopUpsProtocol <NSObject>

//活动类型（标识符）
@property (nonatomic, copy) NSString *type;

//跳转url
@property (nonatomic, copy) NSString *url;

//文字内容
@property(nonatomic, copy) NSString *content;

@required
- (void)execute;

@end

NS_ASSUME_NONNULL_END
