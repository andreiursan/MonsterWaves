//
//  EnemySpecs.m
//
//  Created by Andrei Ursan on 7/14/13.
//  Copyright (c) 2013 Andrei Ursan. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "Enemy.h"


SpecBegin(Enemy)

describe(@"Enemy", ^{
  
  __block Enemy *enemy;
  
  beforeEach(^{
    enemy = [[Enemy alloc] init];
  });
  
  itShouldBehaveLike(@"a movable object", ^{
    return @{ @"movable" : enemy };
  });

});

SpecEnd
