//
//  ViewController.m
//  emitterLayerDemo
//
//  Created by liqi on 16/9/19.
//  Copyright © 2016年 liqi. All rights reserved.
//

#import "ViewController.h"

#define kWidth self.view.frame.size.width
#define KHeight self.view.frame.size.height
@interface ViewController ()

@property (nonatomic,weak) CAEmitterLayer  *emitterLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.emitterLayer setHidden:NO];
}


- (CAEmitterLayer *)emitterLayer
{
    if (!_emitterLayer) {
        CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
        //发射器在xy平面的中心位置
        emitterLayer.emitterPosition = CGPointMake(kWidth/2, KHeight-50);
        //发射器尺寸的大小
        emitterLayer.emitterSize = CGSizeMake(30, 30);
        //渲染模式
        emitterLayer.renderMode = kCAEmitterLayerUnordered;
        //开启三维效果
//        _emitterLayer.preservesDepth = YES;
        NSMutableArray *array = [NSMutableArray array];
        //创建粒子
        for (int i = 0; i<10; i++) {
            //发射单元
            CAEmitterCell *stepCell = [CAEmitterCell emitterCell];
            //粒子的穿件速率  默认为1/s
            stepCell.birthRate = 1;
            //粒子存活时间
            stepCell.lifetime = arc4random_uniform(4)+1;
            //粒子的生存时间容差
            stepCell.lifetimeRange = 1.5;
            //颜色
              UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", i]];
            //粒子显示的内容
            stepCell.contents = (id)[image CGImage];
            //粒子的名字
            //粒子的运动速度
            stepCell.velocity = arc4random_uniform(100) + 100;
            //粒子速度的容差
            stepCell.velocityRange = 80;
            //粒子在xy平面的发射角度
            stepCell.emissionLongitude = M_PI + M_PI_2;
            //粒子发射角度的容差
            stepCell.emissionRange = M_PI_2/6;
            //缩放比例
            stepCell.scale = 0.3;
            [array addObject:stepCell];
            
        }
        emitterLayer.emitterCells = array;
        [self.view.layer addSublayer:emitterLayer];
        _emitterLayer = emitterLayer;
        
    }
    return _emitterLayer;
    
}




@end
