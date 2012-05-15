//
//  C4WorkSpace.m
//  randomMovement
//
//  Created by Travis Kirton on 12-05-10.
//  Copyright (c) 2012 POSTFL. All rights reserved.
//

#import "C4WorkSpace.h"
#import "TimedShape.h"

@interface C4WorkSpace ()
-(void)divideTimedShape:(NSNotification *)notification;
@end

@implementation C4WorkSpace {
    TimedShape *t;
}

-(void)setup {
    t = [TimedShape new];
    [t ellipse:CGRectMake(10, 10, 20, 20)];
    [self.canvas addShape:t];
    [t changePosition];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(divideTimedShape:) 
                                                 name:@"timedShapeShouldDivide"
                                               object:nil];
}

-(void)divideTimedShape:(NSNotification *)notification {
    TimedShape *ts = [((TimedShape *)[notification object]) copy];
    [self.canvas addShape:ts];
}
@end
