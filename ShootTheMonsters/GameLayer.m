//
//  GameLayer.m
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 2/27/13.
//  Copyright Andrei Ursan 2013. All rights reserved.
//


#import "GameLayer.h"
#import "AppDelegate.h"
#import "GameOverLayer.h"

#pragma mark - GameLayer


@implementation GameLayer


+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	GameLayer *layer = [GameLayer node];
	[scene addChild: layer];
	
	return scene;
}

-(id) init
{
	if( (self=[super initWithColor:ccc4(255,255,255,255)]) ) {
    [self setTouchEnabled:YES];
    winSize = [[CCDirector sharedDirector] winSize];
    player = [CCSprite spriteWithFile:@"player.png"];
    player.position = ccp(player.contentSize.width/2, winSize.height/2);
    [self addChild: player];
    
    _monsters = [[NSMutableArray alloc] init];
    _projectiles = [[NSMutableArray alloc] init];
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"background-music-aac.caf"];
    
    [self schedule:@selector(gameLogic:) interval:1.0];
    [self schedule:@selector(update:)];
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

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  // Get Touch Location
  UITouch *touch = [touches anyObject];
  CGPoint location = [self convertTouchToNodeSpace:touch];
  // Set intial position for Projectile
  CCSprite *projectile = [CCSprite spriteWithFile:@"projectile.png"];
  projectile.position = ccp(20, winSize.height/2);
  // Determin Offise
  CGPoint offset = ccpSub(location, projectile.position);
  //
  if (offset.x <= 0) return;
  
  [self addChild:projectile];
  
  int realX = winSize.width + (projectile.contentSize.width/2);
  float ratio = (float) offset.y / (float) offset.x;
  int realY = (realX * ratio) + projectile.position.y;
  CGPoint realDest = ccp(realX, realY);
  
  // Determine the length of how far you're shooting
  int offRealX = realX - projectile.position.x;
  int offRealY = realY - projectile.position.y;
  float length = sqrtf((offRealX*offRealX)+(offRealY*offRealY));
  float velocity = 480/1; // 480pixels/1sec
  float realMoveDuration = length/velocity;
  
  projectile.tag = 2;
  [_projectiles addObject:projectile];
  
  // Move projectile to actual endpoint
  [projectile runAction: [CCSequence actions: [CCMoveTo actionWithDuration:realMoveDuration position:realDest],
                                              [CCCallBlockN actionWithBlock:^(CCNode *node) {
                                                [_projectiles removeObject:node];
                                              }],
                                              nil ]];
  [[SimpleAudioEngine sharedEngine] playEffect:@"pew-pew-lei.caf"];
}


- (void)update:(ccTime)dt {
  
  NSMutableArray *projectilesToDelete = [[NSMutableArray alloc] init];
  for (CCSprite *projectile in _projectiles) {
    
    NSMutableArray *monstersToDelete = [[NSMutableArray alloc] init];
    for (CCSprite *monster in _monsters) {
      
      if (CGRectIntersectsRect(projectile.boundingBox, monster.boundingBox)) {
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
    [monstersToDelete release];
  }
  
  for (CCSprite *projectile in projectilesToDelete) {
    [_projectiles removeObject:projectile];
    [self removeChild:projectile cleanup:YES];
  }
  [projectilesToDelete release];
}

- (void) dealloc {
  _monsters = nil;
  _projectiles = nil;
  [_monsters release];
  [_projectiles release];
	[super dealloc];
}

@end
