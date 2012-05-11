//
//  C4WorkSpace.m
//  randomMovement
//
//  Created by Travis Kirton on 12-05-10.
//  Copyright (c) 2012 POSTFL. All rights reserved.
//

#import "C4WorkSpace.h"
#import "TimedShape.h"

@implementation C4WorkSpace {
    TimedShape *t;
}

-(void)setup {
    t = [TimedShape new];
    [t ellipse:CGRectMake(10, 10, 20, 20)];
    [self.canvas addShape:t];
    [t changePosition];
}

@end
