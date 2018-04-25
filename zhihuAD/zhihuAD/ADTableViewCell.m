//
//  ADTableViewCell.m
//  zhihuAD
//
//  Created by xhwl on 2018/4/25.
//  Copyright © 2018年 红蜀黍. All rights reserved.
//

#import "ADTableViewCell.h"
#import "ADModel.h"

@interface ADTableViewCell ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *adImageView;

@end

@implementation ADTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.scrollView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollViewDidScrollllll:) name:@"scrollViewDidScroll" object:nil];
    }
    return self;
}

- (void)setModel:(ADModel *)model {
    _model = model;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.scrollView.frame = self.contentView.frame;
}

- (void)scrollViewDidScrollllll:(NSNotification *)noti {
    UIScrollView *scrollView = noti.object;
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"scrollViewDidScrollllll %f",offsetY);
    
    CGPoint offset = self.scrollView.contentOffset;
    offset.y = self.model.index*180 - offsetY;
    self.scrollView.contentOffset = offset;
}

#pragma mark - Lazy
- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        
        UIImageView *imageView = [[UIImageView alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"music_listen_bg.jpg" ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        imageView.image = image;
        //[UIImage imageNamed:@"ad"];
        imageView.frame = CGRectMake(0, 0, width, height);
        self.adImageView = imageView;
        
        _scrollView.scrollEnabled = NO;
        // 设置滚动范围（内容大小）
        _scrollView.contentSize = CGSizeMake(width, height);
        [_scrollView addSubview:self.adImageView];
    }
    return _scrollView;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
