//
//  TimedShape.h
//  timedAnimations
//
//  Created by Travis Kirton on 12-05-10.
//  Copyright (c) 2012 POSTFL. All rights reserved.
//

#import "C4Shape.h"

@interface TimedShape : C4Shape
-(id)initWithTimedShape:(TimedShape *)ts;
-(void)changePosition;
@end
