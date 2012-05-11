//
//  TimedShape.m
//  timedAnimations
//
//  Created by Travis Kirton on 12-05-10.
//  Copyright (c) 2012 POSTFL. All rights reserved.
//

#import "TimedShape.h"

@interface TimedShape ()
@property (readwrite, strong) NSTimer *movementTimer;
@end

@implementation TimedShape
@synthesize movementTimer;

-(void)changePosition {
    CGFloat randomTime = ((CGFloat)[C4Math randomInt:100])/25.0f;
    self.animationDuration = randomTime;
    self.center = CGPointMake([C4Math randomInt:self.superview.frame.size.width], [C4Math randomInt:self.superview.frame.size.height]);
    self.movementTimer = [NSTimer timerWithTimeInterval:randomTime 
                                                 target:self 
                                               selector:@selector(changePosition) 
                                               userInfo:nil 
                                                repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:self.movementTimer forMode:NSDefaultRunLoopMode];
}
@end
