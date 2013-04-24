//
//  ObjectHavenSpec.m
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 4/17/13.
//  Copyright (c) 2013 Andrei Ursan. All rights reserved.
//

#import "Kiwi.h"

SPEC_BEGIN(ObjectHavenSpec)

describe(@"ObjectHavenSpec", ^{
  registerMatchers(@"BG"); // Registers BGTangentMatcher, BGConvexMatcher, etc.
  
  context(@"a state the component is in", ^{
    __block id variable = nil;
    
    beforeAll(^{ // Occurs once
    });
    
    afterAll(^{ // Occurs once
    });
    
    beforeEach(^{ // Occurs before each enclosed "it"
    });
    
    afterEach(^{ // Occurs after each enclosed "it"
    });
    
    pending(@"should do something", ^{
    });
    
    specify(^{
    });
    
    context(@"inner context", ^{
      it(@"does another thing", ^{
      });
      
      pending(@"something unimplemented", ^{
      });
    });
    
  });
});

SPEC_END
