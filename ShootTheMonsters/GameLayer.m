//
//  GameLayer.m
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 2/27/13.
//  Copyright Andrei Ursan 2013. All rights reserved.
//


#import "GameLayer.h"

#pragma mark - GameLayer


@implementation GameLayer


+ (CCScene *)scene {
	CCScene *scene = [CCScene node];
	GameLayer *layer = [GameLayer node];
	[scene addChild: layer];
	return scene;
}

- (id)init {
	if((self=[super initWithColor:ccc4(255,255,255,255)])) {
    [self setTouchEnabled:YES];
    winSize = [[CCDirector sharedDirector] winSize];
    player  = [CCSprite spriteWithFile:@"player.png"];
    player.position = ccp(player.contentSize.width/2, winSize.height/2);
    [self addChild: player];
    _monsters    = [NSMutableArray new];
    _projectiles = [NSMutableArray new];
    _touches     = [NSMutableArray new];
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"background-music-aac.caf"];
    [self schedule:@selector(gameLogic:) interval:1.0];
    [self schedule:@selector(update:)];
    return self;
	} else {
    return nil;
  }
}

- (void)gameLogic:(ccTime)dt {
  [self addMonster];
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  UITouch *touch = [touches anyObject];
  [_touches addObject:touch];
  CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
  Bullet *bullet = [Bullet createWithStartPosition:player.position touchLocation:touchLocation layer: self];
  [_projectiles addObject:bullet];
}

- (void)addMonster{
  // Add Monster
  CCSprite *monster = [CCSprite spriteWithFile:@"monster.png"];
  int minY = monster.contentSize.height / 2;
  int maxY = winSize.height - minY;
  int actualY = (arc4random() % (maxY-minY)) + minY;
  monster.position = ccp(winSize.width, actualY);
  [self addChild:monster];
  
  // Determine Monster's speed
  int minDuration = 2.0;
  int maxDuration = 4.0;
  int actualDuration = (arc4random() % (maxDuration - minDuration)) + minDuration;
  
  monster.tag = 1;
  [_monsters addObject: monster];
  
  CCMoveTo *moveAction = [CCMoveTo actionWithDuration:actualDuration position:ccp(-monster.contentSize.width/2, actualY)];
  CCCallBlockN *moveActionDone = [CCCallBlockN actionWithBlock:^(CCNode *node){
    [_monsters removeObject:node];
    CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO];
    [[CCDirector sharedDirector] replaceScene:gameOverScene];
  }];
  
  [monster runAction:[CCSequence actions:moveAction, moveActionDone, nil]];
}

- (void)update:(ccTime)dt {
  for (Bullet *projectile in _projectiles) {
    [projectile updatePostion:dt];
  }
  NSMutableArray *projectilesToDelete = [[NSMutableArray alloc] init];
  for (Bullet *projectile in _projectiles) {
    
    NSMutableArray *monstersToDelete = [[NSMutableArray alloc] init];
    for (CCSprite *monster in _monsters) {
      if (CGRectIntersectsRect(projectile.sprite.boundingBox, monster.boundingBox)) {
        [monstersToDelete addObject:monster];
      }
    }
    
    for (CCSprite *monster in monstersToDelete) {
      [_monsters removeObject:monster];
      [self removeChild:monster cleanup:YES];
      _monstersDestroyed++;
      if (_monstersDestroyed >= 30){
        CCScene *gameOverScene = [GameOverLayer sceneWithWon:YES];
        [[CCDirector sharedDirector] replaceScene:gameOverScene];
      }
    }
    
    if (monstersToDelete.count > 0) {
      [projectilesToDelete addObject:projectile];
    }
  }
  
  for (Bullet *projectile in projectilesToDelete) {
    [projectile remove];
    [_projectiles removeObject:projectile];
  }
}



@end
