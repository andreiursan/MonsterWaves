//
//  GameConfig.h
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 3/14/13.
//  Copyright (c) 2013 Andrei Ursan. All rights reserved.
//

#ifndef ShootTheMonsters_GameConfig_h
#define ShootTheMonsters_GameConfig_h

#define kProjectileFile @"projectile.png"
#define kMonsterFile @"monster.png"
#define kPlayerFile @"player.png"
#define kProjectileSpeed 480
#define kMonsterMinSpeed 100
#define kMonsterMaxSpeed 200
#define kVectorUp     CGPointMake(0,1)
#define kVectorDown   CGPointMake(0,-1)
#define kVectorRight  CGPointMake(1,0)
#define kVectorLeft   CGPointMake(-1,0)
#define kWinSize [[CCDirector sharedDirector] winSize]
#define kWinHeight [[CCDirector sharedDirector] winSize].height
#define kWinWidth [[CCDirector sharedDirector] winSize].width
#define kWinBounds [[CCDirector sharedDirector] view].bounds
#define kWinCenter CGPointMake(kWinWidth/2, kWinHeight/2)

#endif
