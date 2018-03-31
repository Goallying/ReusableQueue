//
//  ViewController.m
//  ReusableQueue
//
//  Created by 朱来飞 on 2018/3/31.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "ViewController.h"
#import "DispatchQueuePool.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
    //DispatchQueueGetForQOS(NSQualityOfServiceDefault) 返回串行队列, 多次调用DispatchQueueGetForQOS 实际上是创建多条串行队列执行任务。
    
    dispatch_async(DispatchQueueQosDefault(), ^{
        sleep(5);
        NSLog(@"11111 == %@",[NSThread currentThread]);
        
    });
    dispatch_async(DispatchQueueQosDefault(), ^{
        sleep(5);

        NSLog(@"22222 == %@",[NSThread currentThread]);

    });
    dispatch_async(DispatchQueueQosDefault(), ^{
        sleep(5);

        NSLog(@"33333 == %@",[NSThread currentThread]);

    });
    dispatch_async(DispatchQueueQosDefault(), ^{
        sleep(5);
        NSLog(@"44444 == %@",[NSThread currentThread]);

    });
    
    //输出不固定.
//    2018-03-31 14:16:32.908090+0800 ReusableQueue[1452:283303] 11111 == <NSThread: 0x604000271500>{number = 3, name = (null)}
//    2018-03-31 14:16:32.908090+0800 ReusableQueue[1452:283302] 33333 == <NSThread: 0x60000026a3c0>{number = 4, name = (null)}
//    2018-03-31 14:16:32.908127+0800 ReusableQueue[1452:283305] 44444 == <NSThread: 0x604000278f80>{number = 6, name = (null)}
//    2018-03-31 14:16:32.908131+0800 ReusableQueue[1452:283304] 22222 == <NSThread: 0x60400027b480>{number = 5, name = (null)}
//    2018-03-31 14:16:32.908616+0800 ReusableQueue[1452:283303] 55555 == <NSThread: 0x604000271500>{number = 3, name = (null)}

    // cpu 核心运行数当前是4 ，当执行第五个任务的时候,复用任务1所在的queue ，必须等1 执行完才能执行555， 类型线程堵塞。
    dispatch_async(DispatchQueueQosDefault(), ^{
        NSLog(@"55555 == %@",[NSThread currentThread]);
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
