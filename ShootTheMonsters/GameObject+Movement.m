//
//  GameObject+Movement.m
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 4/2/13.
//  Copyright (c) 2013 Andrei Ursan. All rights reserved.
//

#import "GameObject+Movement.h"


@implementation GameObject (Movement)

@dynamic direction, speed;

- (void)updatePosition:(ccTime)dt {
  [self setPosition: ccpAdd(self.position, ccpMult(self.direction, dt * self.speed))];
}

@end
