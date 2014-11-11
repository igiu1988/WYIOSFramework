//
//  UIView+LineWithAutolayout.m
//  ZhengXing
//
//  Created by wangyang on 11/6/14.
//  Copyright (c) 2014 Wanmei Creative. All rights reserved.
//

#import "UIView+LineWithAutolayout.h"

@implementation UIView (LineWithAutolayout)

- (void)addTopLine
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.5)];
    line.backgroundColor = RGBCOLOR_HEX(0xdfdfdd);
    line.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:line];
    
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:line
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1.0 constant:0],
                               [NSLayoutConstraint constraintWithItem:line
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1.0 constant:0],
                               [NSLayoutConstraint constraintWithItem:line
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1.0 constant:0]]];
    
    [line addConstraint:[NSLayoutConstraint constraintWithItem:line
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1.0 constant:0.5]];
    
}

- (void)addBottomLine
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.5)];
    line.backgroundColor = RGBCOLOR_HEX(0xdfdfdd);
    line.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:line];
    
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeLeft
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeft
                                                       multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1.0 constant:0]]];
    
    [line addConstraint:[NSLayoutConstraint constraintWithItem:line
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1.0 constant:0.5]];
    
}

- (void)addTopLineForView:(UIView *)view
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.5)];
    line.backgroundColor = RGBCOLOR_HEX(0xdfdfdd);
    line.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:line];
    
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:view
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeLeft
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:view
                                                        attribute:NSLayoutAttributeLeft
                                                       multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:view
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1.0 constant:0]]];
    
    [line addConstraint:[NSLayoutConstraint constraintWithItem:line
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1.0 constant:0.5]];
}

- (void)addBottomLineForView:(UIView *)view
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.5)];
    line.backgroundColor = RGBCOLOR_HEX(0xdfdfdd);
    line.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:line];
    
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:view
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeLeft
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:view
                                                        attribute:NSLayoutAttributeLeft
                                                       multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:view
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1.0 constant:0]]];
    
    [line addConstraint:[NSLayoutConstraint constraintWithItem:line
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1.0 constant:0.5]];
}

- (void)addSeperatorWithLeft:(float)left right:(float)right
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    line.backgroundColor = RGBCOLOR_HEX(0xdfdfdd);
    line.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:line];
    
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeLeft
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeft
                                                       multiplier:1.0 constant:left],
                           [NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1.0 constant:right]]];
    
    [line addConstraint:[NSLayoutConstraint constraintWithItem:line
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1.0 constant:0.5]];

}

- (void)addHorizenalSeperatorWithLeft:(float)left right:(float)right top:(float)top
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    line.backgroundColor = RGBCOLOR_HEX(0xdfdfdd);
    line.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:line];
    
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0 constant:top],
                           [NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeLeft
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeft
                                                       multiplier:1.0 constant:left],
                           [NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1.0 constant:right]]];
    
    [line addConstraint:[NSLayoutConstraint constraintWithItem:line
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1.0 constant:0.5]];
}

- (void)addVerticalSeperatorWithLeft:(float)left top:(float)top bottom:(float)bottom
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    line.backgroundColor = RGBCOLOR_HEX(0xdfdfdd);
    line.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:line];
    
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0 constant:top],
                           [NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeLeft
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeft
                                                       multiplier:1.0 constant:left],
                           [NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0 constant:bottom]]];
    
    [line addConstraint:[NSLayoutConstraint constraintWithItem:line
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1.0 constant:0.5]];
}


@end
