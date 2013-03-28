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
  Enemy *enemy = [Enemy createOnLayer:self];
  [_monsters addObject:enemy];
}

- (void)update:(ccTime)dt {
  for (Bullet *projectile in _projectiles) {
    [projectile updatePostion:dt];
  }
  for (Enemy *enemy in _monsters) {
    [enemy updatePosition:dt];
  }
  
  NSMutableArray *projectilesToDelete = [[NSMutableArray alloc] init];

  for (Bullet *projectile in _projectiles) {
  
    NSMutableArray *monstersToDelete = [[NSMutableArray alloc] init];

    for (Enemy *monster in _monsters) {
      if (CGRectIntersectsRect(projectile.sprite.boundingBox,
                               monster.sprite.boundingBox)) {
        [monstersToDelete addObject:monster];
      }
    }
    
    for (Enemy *monster in monstersToDelete) {
      [monster remove];
      [_monsters removeObject:monster];
      _monstersDestroyed++;
      if (_monstersDestroyed >= 30){
        CCScene *gameOverScene = [GameOverLayer sceneWithWon:YES];
        [[CCDirector sharedDirector] replaceScene:gameOverScene];
      }
    }
    
    if (monstersToDelete.count > 0 || winSize.height < projectile.sprite.position.y || winSize.width < projectile.sprite.position.x ) {
      [projectilesToDelete addObject:projectile];
    }
    
  }
  
  for (Bullet *projectile in projectilesToDelete) {
    [projectile remove];
    NSLog(@"projectiles %d", _projectiles.count);
    [_projectiles removeObject:projectile];
  }
}



@end
