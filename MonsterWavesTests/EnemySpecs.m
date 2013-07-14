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

SharedExamplesBegin(MySharedExamples)

sharedExamplesFor(@"movable object", ^(NSDictionary *data) {
  it(@"should do some stuff", ^{
    id obj = [data objectForKey:@"movable"];
    expect([obj respondsToSelector:@selector(updatePosition:)]).to.beTruthy();
  });
});

SharedExamplesEnd


SpecBegin(Thing)

describe(@"Thing", ^{
  
  __block Enemy *enemy;
  
  beforeEach(^{
    enemy = [[Enemy alloc] init];
  });
  
  itShouldBehaveLike(@"movable object", ^{
    return @{ @"movable" : enemy };
  });

});

SpecEnd
