//
//  TimedShape.m
//  timedAnimations
//
//  Created by Travis Kirton on 12-05-10.
//  Copyright (c) 2012 POSTFL. All rights reserved.
//

#import "TimedShape.h"

@interface TimedShape ()
-(void)startDying;
@property (readwrite, strong) NSTimer *movementTimer;
@end

@implementation TimedShape {
    BOOL isDying;
}

@synthesize movementTimer;

-(id)initWithTimedShape:(TimedShape *)ts {
    self = [super initWithFrame:ts.frame];
    if(self) {
        isDying = NO;
        self.animationDuration = 0.0f;
        [self ellipse: self.frame];
        [self performSelector:@selector(changePosition) withObject:nil afterDelay:0.5];
        
        CGFloat lifeSpan = ((CGFloat)[C4Math randomInt:100])/5.0f+5.0f;
        [self performSelector:@selector(startDying) withObject:self afterDelay:lifeSpan];
    }
    return self;
}

-(void)changePosition {
    if([C4Math randomInt:15] < 2 && isDying == NO) {
        [self postNotification:@"timedShapeShouldDivide"];
    }
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

-(id)copyWithZone:(NSZone *)zone {
   return [[TimedShape alloc] initWithTimedShape:self];
}

-(void)startDying {
    isDying = YES;
    [self.movementTimer invalidate];
    self.movementTimer = nil;
    self.animationDuration = ((CGFloat)[C4Math randomInt:30])/10.0f + 1.0f;
    self.fillColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.0f];
    self.strokeColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.0f];
    [self performSelector:@selector(removeFromSuperview) 
               withObject:nil 
               afterDelay:self.animationDuration];
}

@end
