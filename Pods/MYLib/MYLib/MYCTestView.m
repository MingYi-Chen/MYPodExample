//
//  MYCTestView.m
//  MYLib
//
//  Created by Ming Yi Chen on 18/02/2017.
//  Copyright © 2017 Ming Yi Chen. All rights reserved.
//

#import "MYCTestView.h"


@implementation MYCTestView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 2.0f);
    
    CGContextMoveToPoint(context, 0.0f, 0.0f); //start at this point
    
    CGContextAddLineToPoint(context, 20.0f, 20.0f); //draw to this point
    
    // and now draw the Path!
    CGContextStrokePath(context);
    
    
}

- (void)addCustomedLayer {
    
    CALayer* layer = [CALayer layer];
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    layer.cornerRadius = 20.0;
    layer.frame = CGRectInset(self.layer.frame, 20, 20);
    [self.layer addSublayer:layer];
    
}


@end
