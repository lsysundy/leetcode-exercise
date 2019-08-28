//
//  ReverseList.h
//  OCArithmeticTest
//
//  Created by 刘帅仪 on 2019/8/27.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import <Foundation/Foundation.h>

// 链表节点定义
typedef struct _node{
    // 数据
    NSString *data;
    // 下一个指针
    struct _node* next;
} HGNode;


@interface ReverseList : NSObject

//链表反转逻辑
/**
 * 返回值-struct Node* 新的链表头结点
 * 参数：目标链表头结点
 */
HGNode* reverseList(HGNode* head);

- (void)traverseLink;



@end

