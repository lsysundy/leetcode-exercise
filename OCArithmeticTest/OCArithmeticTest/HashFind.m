//
//  HashFind.m
//  OCArithmeticTest
//
//  Created by 刘帅仪 on 2019/8/28.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "HashFind.h"

@implementation HashFind

char findFirstChar(char *cha) {
    
    char result = '\0'; //空字符
    int array[256]; //存储各个字母出现的次数
//    初始化数组
    for (int i = 0; i < 256; i++) {
        array[i] = 0;
    }
    char *p = cha;
    printf("*p: %c \n p: %s \n", *p, p);
    while (*p != '\0') {
        printf("============\n");
        printf("*(p++): %c \n array: %@ \n", *(p++), array);
        printf("============\n");

        array[*(p++)]++; //次数加一
        
    }
    p = cha;
    while (*p != '\0') {
        if (array[*p] == 1) {
            result = *p;
            break;
        }
        p++;
    }
    
    return result;
}

@end
