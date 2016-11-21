//
//  SimpleCollectionViewCell.m
//  正则表达式
//
//  Created by fans on 16/11/21.
//  Copyright © 2016年 FF. All rights reserved.
//

#import "SimpleCollectionViewCell.h"

@implementation SimpleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeView];
    }
    return self;
}
- (void)makeView{
    _titleLabel = [UILabel new];
    _titleLabel.frame = CGRectMake(0, 0, 100 ,100);
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_titleLabel];

}
@end
