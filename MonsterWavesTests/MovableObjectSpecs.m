//
//  MovableObjectSpecs.m
//  MonsterWaves
//
//  Created by Andrei Ursan on 7/15/13.
//  Copyright (c) 2013 Andrei Ursan. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"

SharedExamplesBegin(MovableObjectExamples)

sharedExamplesFor(@"a movable object", ^(NSDictionary *data) {
  it(@"should do some stuff", ^{
    id obj = [data objectForKey:@"movable"];
    expect([obj respondsToSelector:@selector(updatePosition:)]).to.beTruthy();
  });
});

SharedExamplesEnd
