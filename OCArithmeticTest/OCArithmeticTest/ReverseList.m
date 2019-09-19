//
//  ReverseList.m
//  OCArithmeticTest
//
//  Created by 刘帅仪 on 2019/8/27.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "ReverseList.h"

@interface ReverseList ()

@property (nonatomic, strong) NSArray* dataArr;

@end

@implementation ReverseList

HGNode* reverseList(HGNode* head) {
    HGNode *p = head;
    HGNode *newH = NULL;
    
    while (p != NULL) {
        HGNode *temp = p->next;
        p->next = newH;
        newH = p;
        p = temp;
    }
    return newH;
}

// 创建一个链表 返回一个头节点
- (HGNode*)createLink {
    // 先创建一个 head 节点
    self.dataArr = @[@1,@2,@3,@4];
    HGNode *head = NULL;
    HGNode *cur = NULL;
    for (int i = 1; i < 5; i++) {
        //分配链表节点空间
        HGNode *node = malloc(sizeof(HGNode));
        node->data = self.dataArr[i-1];
        if (head == NULL) {
            head = node;
        }else {
            cur->next = node;
        }
        cur = node;
    }
    
    return head;
}

// 打印
- (void)printWithLink:(HGNode*)headeLink {
    NSMutableArray* tmpArrM = [NSMutableArray array];
    // 遍历单列表
    HGNode* tmpLink = headeLink;
    
    while (tmpLink) {
        [tmpArrM addObject:[NSString stringWithFormat:@"%@", tmpLink->data]];
        tmpLink = tmpLink->next;
    }
    
    NSLog(@"链表打印: %@", [tmpArrM componentsJoinedByString:@"-->"]);
}

- (void)traverseLink {
    HGNode* head = [self createLink];
    [self printWithLink:head];
    
    HGNode *newHead = reverseList(head);
    [self printWithLink:newHead];
}


@end

