//
//  GameLayer.h
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 2/27/13.
//  Copyright Andrei Ursan 2013. All rights reserved.
//


#import <GameKit/GameKit.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"
#import "AppDelegate.h"
#import "GameOverLayer.h"
#import "Bullet.h"
#import "Enemy.h"
#import "Player.h"

@interface GameLayer : CCLayerColor {
  Player *_player;
  NSMutableArray *_monsters;
  NSMutableArray *_projectiles;
  NSMutableArray *_touches;
  int _monstersDestroyed;
}

+ (CCScene *)scene;
- (void)slowUpdate:(ccTime)dt;

@end
