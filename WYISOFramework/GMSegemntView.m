//
//  GMSegemntControl.m
//  GMSegemntControl
//
//  Created by wangyang on 11/2/14.
//  Copyright (c) 2014 gengmei. All rights reserved.
//

#import "GMSegemntView.h"

#define BADGE_VIEW_TAG_BASE         1000

@interface GMSegemntView ()
{
    GMSegemntViewValueChangeBlock _valueChangeBlock;
    NSArray *_items;
    NSMutableArray *array;
    
    // 这个属性是需要变化的，所以单独拿出来
    NSLayoutConstraint *selectViewLeftConstraint;
}


@property (nonatomic, strong) UISegmentedControl *segmentControl;
@property (nonatomic, strong) UIView   *selectedView;

@end
@implementation GMSegemntView


#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}

- (void)setItems:(NSArray *)items segmentValueChange:(GMSegemntViewValueChangeBlock)valueChangeBlock
{
    _valueChangeBlock = valueChangeBlock;
    _items = items;
    
    [self addSubview:self.segmentControl];
    [self addSubview:self.selectedView];
    [self setupViewConstraint];
    
    [self addTopLine];
    [self addBottomLine];
}

#pragma mark - View 管理
- (UISegmentedControl *)segmentControl
{
    if (!_segmentControl) {
        _segmentControl = [[UISegmentedControl alloc] initWithItems:_items];
        _segmentControl.frame = self.bounds;
        _segmentControl.translatesAutoresizingMaskIntoConstraints = NO;
        [_segmentControl addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        // button 字体
        [[UISegmentedControl appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0.463f green:0.467f blue:0.471f alpha:1.0f],NSFontAttributeName : [UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
        [[UISegmentedControl appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0.071f green:0.773f blue:0.773f alpha:1.0f], NSFontAttributeName : [UIFont systemFontOfSize:15]} forState:UIControlStateSelected];
        
        // 背景
        self.backgroundColor = [UIColor whiteColor];
        
        // 分隔线
        self.showDividImage = YES;
        
        _segmentControl.selectedSegmentIndex = 0;
    }
    
    return _segmentControl;
}

- (UIView *)selectedView {
    if (!_selectedView) {
        // 底部提示器，宽度会在 adjustSelectedView: 中设置
        _selectedView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 2, 0, 2)];
        _selectedView.translatesAutoresizingMaskIntoConstraints = NO;
        _selectedView.backgroundColor = [UIColor colorWithRed:0.071f green:0.773f blue:0.773f alpha:1.0f];
    }
    
    return _selectedView;
}

- (void)setupViewConstraint
{
    
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:self.segmentControl
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:self.segmentControl
                                                        attribute:NSLayoutAttributeLeft
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeft
                                                       multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:self.segmentControl
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:self.segmentControl
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0 constant:0]]];
    
    selectViewLeftConstraint = [NSLayoutConstraint constraintWithItem:self.selectedView
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.segmentControl
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1.0
                                                             constant:0];
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:self.selectedView
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0 constant:self.bounds.size.height - 2],
                           selectViewLeftConstraint,
                           [NSLayoutConstraint constraintWithItem:_selectedView
                                                        attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:_segmentControl
                                                        attribute:NSLayoutAttributeWidth
                                                       multiplier:1.0/3 constant:0]]];
    
    [_selectedView addConstraint:[NSLayoutConstraint constraintWithItem:_selectedView
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:nil
                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                             multiplier:1.0 constant:2]];
}

- (void)addBadgeImageAtIndex:(NSUInteger)index
{
    if (index > _segmentControl.numberOfSegments) {
        return;
    }
    UIImage* image = [UIImage imageNamed:@"red_icon.png"];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.tag = BADGE_VIEW_TAG_BASE + index;
    imageView.frame = CGRectMake(0, 0, 8, 8);
    
    [self addSubview:imageView];
    
    
    NSLayoutConstraint *cons1 = [NSLayoutConstraint constraintWithItem:imageView
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1.0 constant:10];

    NSLayoutConstraint *cons2 = [NSLayoutConstraint constraintWithItem:imageView
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0/3*(index + 1) constant:-35];
    
    [self addConstraints:@[cons1,cons2]];
    
    [imageView addConstraints:@[[NSLayoutConstraint constraintWithItem:imageView
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1.0 constant:8],
                               [NSLayoutConstraint constraintWithItem:imageView
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1.0 constant:8]]];
}

- (void)removeBadgeImageAtIndex:(NSUInteger)index
{
    if (index > _segmentControl.numberOfSegments) {
        return;
    }
    [[self viewWithTag:BADGE_VIEW_TAG_BASE + index] removeFromSuperview];
}


#pragma mark - View 管理：私有

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    
    [[UISegmentedControl appearance] setBackgroundImage:[UIImage new] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setBackgroundImage:[UIImage new] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
}

- (void)setShowDividImage:(BOOL)showDividImage
{
    _showDividImage = showDividImage;
    
    // 分隔符
    if (showDividImage) {
        if (!_dividImage) {
            _dividImage = [UIImage imageNamed:@"discover_tab_line"];
        }
        
    }else{
        _dividImage = [UIImage new];
    }
    
    [[UISegmentedControl appearance] setDividerImage:_dividImage forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setDividerImage:_dividImage forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setDividerImage:_dividImage forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}

- (void)setDividImage:(UIImage *)dividImage
{
    _dividImage = dividImage;
    self.showDividImage = YES;
}
#pragma mark - 事件响应

- (void)segmentValueChanged:(UISegmentedControl *)control
{
    selectViewLeftConstraint.constant = 1.0/3 * _segmentControl.bounds.size.width * _segmentControl.selectedSegmentIndex;
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
    }];
    

    if (_valueChangeBlock) {
        _valueChangeBlock(_segmentControl.selectedSegmentIndex);
    }
}

- (UIView *)addTopLine
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0.5)];
    line.backgroundColor = RGBCOLOR_HEX(0xdfdfdd);
    line.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:line];
    
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0 constant:-0.5],
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
    
    return line;
}
- (UIView *)addBottomLine
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0.5)];
    line.backgroundColor = RGBCOLOR_HEX(0xdfdfdd);
    line.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:line];
    
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:line
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0 constant:self.bounds.size.height - 0.5],
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
    
    return line;
}




@end



//@implementation UIImage (Private)
//
//#pragma mark - 私有方法
//+ (UIImage *)imageWithColor:(UIColor *)color
//{
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), NO, 0.0f);
//    //UIBezierPath* roundedRect = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 1, 1)];
//    [color setFill];
//    //[roundedRect fill];
//    UIRectFill(CGRectMake(0, 0, 1, 1));
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return [image stretchableImageByCenter];
//}
//
//@end
