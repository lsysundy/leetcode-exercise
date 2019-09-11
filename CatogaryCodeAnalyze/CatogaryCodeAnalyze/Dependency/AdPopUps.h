//
//  AdPopUps.h
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/11.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PopUpsProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AdPopUps : NSObject<PopUpsProtocol>

@property(nonatomic, copy) NSString *type;
@property(nonatomic, copy) NSString *url;
@property(nonatomic, copy) NSString *content;

@end

NS_ASSUME_NONNULL_END
