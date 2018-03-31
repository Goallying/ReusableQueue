//
//  DispatchQueuePool.h
//  ReusableQueue
//
//  Created by 朱来飞 on 2018/3/31.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <Foundation/Foundation.h>

//代码抽离自YYKit
extern dispatch_queue_t DispatchQueueGetForQOS(NSQualityOfService qos);
extern dispatch_queue_t DispatchQueueQosDefault(void) ;

//如果通过实例化了DispatchQueuePool,在该类dealloc的方法，遍历改qos下的queueCount ，释放quesues 。
@interface DispatchQueuePool : NSObject

//- (instancetype)initWithName:(nullable NSString *)name queueCount:(NSUInteger)queueCount qos:(NSQualityOfService)qos;

@end
