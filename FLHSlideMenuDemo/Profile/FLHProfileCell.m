//
//  FLHProfileCell.m
//  FLHSlideMenuDemo
//
//  Created by mac on 2018/6/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FLHProfileCell.h"
#import "FLHCommonItem.h"

@interface FLHProfileCell()

/** 1.图片 */
@property (nonatomic, weak) UIImageView *iconView;
/** 2.标题 */
@property (nonatomic, weak) UILabel *nameLabel;
/** 3.subTitle */
@property (nonatomic, weak) UILabel *subtitle;
/** 4.箭头 */
@property (nonatomic, weak) UIImageView *arrowView;

@end

@implementation FLHProfileCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    return self;
}

/**
 *  初始化子控件
 */
- (void)setupSubviews {
    /** 1.图片 */
    UIImageView *iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:iconView];
    self.iconView = iconView;
    
    // 2.标题
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.textColor = [UIColor colorWithRed:51 / 255.0 green:51 / 255.0 blue:51 / 255.0 alpha:1.0];
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    /** 3.描述 */
    UILabel *subtitle = [[UILabel alloc] init];
    subtitle.textColor = [UIColor colorWithRed:151 / 255.0 green:151 / 255.0 blue:151 / 255.0 alpha:1.0];
    subtitle.font = [UIFont systemFontOfSize:12];
    subtitle.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:subtitle];
    self.subtitle = subtitle;
    
    /** 4.箭头 */
    UIImageView *arrowView = [[UIImageView alloc] init];
    arrowView.image = [UIImage imageNamed:@"caret_right"];
    [self.contentView addSubview:arrowView];
    self.arrowView = arrowView;
}

/**
 * 设置子控件的frame
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat contentW = self.contentView.bounds.size.width;
    CGFloat contentH = self.contentView.bounds.size.height;
    /** 1.图片 */
    CGFloat iconViewX = 15;
    CGFloat iconViewY = 0;
    CGFloat iconViewW = 44;
    CGFloat iconViewH = contentH;
    self.iconView.frame = CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    
    /** 2.标题 */
    CGFloat nameLabelX = CGRectGetMaxX(self.iconView.frame) + 10;
    CGFloat nameLabelY = 0;
    CGFloat nameLabelW = contentW - nameLabelX;
    CGFloat nameLabelH = contentH;
    self.nameLabel.frame = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
    
    /** 4.箭头 */
    CGFloat arrowViewW = 14;
    CGFloat arrowViewX = contentW - 15 - arrowViewW;
    CGFloat arrowViewH = 14;
    CGFloat arrowViewY = (contentH - arrowViewH) / 2;
    self.arrowView.frame = CGRectMake(arrowViewX, arrowViewY, arrowViewW, arrowViewH);
    
    /** 3.子标题 */
    CGFloat subtitleW = 150;
    CGFloat subtitleX = CGRectGetMinX(self.arrowView.frame) - 10 - subtitleW;
    CGFloat subtitleY = 0;
    CGFloat subtitleH = contentH;
    self.subtitle.frame = CGRectMake(subtitleX, subtitleY, subtitleW, subtitleH);
}

- (void)setItem:(FLHCommonItem *)item {
    _item = item;
    self.iconView.image = [UIImage imageNamed:item.icon];
    self.nameLabel.text = item.title;
    self.subtitle.text  = item.subtitle;
}



@end
