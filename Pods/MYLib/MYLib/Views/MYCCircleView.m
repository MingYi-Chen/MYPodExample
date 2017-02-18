//
//  MYCCircleView.m
//  MYLib
//
//  Created by Ming Yi Chen on 18/02/2017.
//  Copyright © 2017 Ming Yi Chen. All rights reserved.
//

#import "MYCCircleView.h"

@implementation MYCCircleView


- (void)drawRect:(CGRect)rect {
    // Drawing code
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 100)] CGPath]];
    [circleLayer setStrokeColor:[[UIColor redColor] CGColor]];
    [circleLayer setFillColor:[[UIColor clearColor] CGColor]];
    [[self layer] addSublayer:circleLayer];
}


@end
