//
//  GameOverLayer.h
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 3/11/13.
//  Copyright 2013 Andrei Ursan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameOverLayer : CCLayerColor {
}

+ (CCScene *)sceneWithWon:(BOOL)won;
- (id)initWithWon:(BOOL)won;

@end
