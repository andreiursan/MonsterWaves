//
//  HelloWorldLayer.m
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 2/27/13.
//  Copyright Andrei Ursan 2013. All rights reserved.
//


#import "HelloWorldLayer.h"
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer


@implementation HelloWorldLayer


+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	HelloWorldLayer *layer = [HelloWorldLayer node];
	[scene addChild: layer];
	
	return scene;
}

-(id) init
{
	if( (self=[super initWithColor:ccc4(255,255,255,255)]) ) {
    player = [CCSprite spriteWithFile:@"player.png"];
    player.position = ccp(player.contentSize.width/2, [self windowSize].height/2);
    [self addChild: player];
    [self schedule:@selector(gameLogic:) interval:1.0];
	}
	return self;
}

- (void) gameLogic:(ccTime)dt{
  [self addMonster];
}

- (void) addMonster{
  // Add Monster
  CCSprite *monster = [CCSprite spriteWithFile:@"monster.png"];
  int minY = monster.contentSize.height / 2;
  int maxY = [self windowSize].height - minY;
  int actualY = (arc4random() % (maxY-minY)) + minY;
  monster.position = ccp([self windowSize].width, actualY);
  [self addChild:monster];
  
  // Determine Mosnter's speed
  int minDuration = 2.0;
  int maxDuration = 4.0;
  int actualDuration = (arc4random() % (maxDuration - minDuration)) + minDuration;
  CCMoveTo *moveAction = [CCMoveTo actionWithDuration:actualDuration position:ccp(-monster.contentSize.width/2, actualY)];
  CCCallBlockN *moveActionDone = [CCCallBlockN actionWithBlock:^(CCNode *node){
    [node removeFromParentAndCleanup:YES];
  }];
  
  [monster runAction:[CCSequence actions:moveAction, moveActionDone, nil]];
}

- (CGSize) windowSize{
  return [[CCDirector sharedDirector] winSize];
}

- (void) dealloc
{
	[super dealloc];
}

@end
