//
//  Movable.h
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 4/3/13.
//  Copyright (c) 2013 Andrei Ursan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Movable <NSObject>

@property (assign)float speed;
@property (assign)CGPoint direction;

- (void)updatePosition:(ccTime)dt;

@end
