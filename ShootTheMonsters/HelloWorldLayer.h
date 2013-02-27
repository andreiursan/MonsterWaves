//
//  HelloWorldLayer.h
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 2/27/13.
//  Copyright Andrei Ursan 2013. All rights reserved.
//


#import <GameKit/GameKit.h>
#import "cocos2d.h"


@interface HelloWorldLayer : CCLayerColor
{
  CCSprite *player;
}

+(CCScene *) scene;

@end
