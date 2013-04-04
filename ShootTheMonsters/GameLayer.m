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
    _player = [Player playerOnLayer:self];
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
  Bullet *bullet = [Bullet bulletWithStartPosition:_player.sprite.position toTouchLocation:touchLocation layer: self];
  [_projectiles addObject:bullet];
}

- (void)addMonster{
  Enemy *enemy = [Enemy enemyOnLayer:self];
  [_monsters addObject:enemy];
}

- (void)update:(ccTime)dt {
  NSMutableArray *projectilesToDelete = [[NSMutableArray alloc] init];
  NSMutableArray *monstersToDelete = [[NSMutableArray alloc] init];
  
  for (Bullet *projectile in _projectiles) {
    [projectile updatePosition:dt];
  }
  
  for (Enemy *enemy in _monsters) {
    [enemy updatePosition:dt];
    if([enemy isOutsideWindow]){
      CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO];
      [[CCDirector sharedDirector] replaceScene:gameOverScene];
    }
  }
  
  // Collision Detection happens here
  for (Bullet *projectile in _projectiles) {
    for (Enemy *monster in _monsters) {
      if (CGRectIntersectsRect(projectile.sprite.boundingBox,
                               monster.sprite.boundingBox)) {
        [monstersToDelete addObject:monster];
        [projectilesToDelete addObject:projectile];
        _monstersDestroyed++;
      }
    }
    if ([projectile isOutsideWindow]) {
      [projectilesToDelete addObject:projectile];
    }
  }
  if (_monstersDestroyed >= 30){
    CCScene *gameOverScene = [GameOverLayer sceneWithWon:YES];
    [[CCDirector sharedDirector] replaceScene:gameOverScene];
  }
  
  //Remove unused GameObjects
  for (Bullet *projectile in projectilesToDelete) {
    [projectile removeFromLayer];
    [_projectiles removeObject:projectile];
  }
  for (Enemy *monster in monstersToDelete) {
    [monster removeFromLayer];
    [_monsters removeObject:monster];
  }
}

@end
