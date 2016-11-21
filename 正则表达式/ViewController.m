//
//  ViewController.m
//  正则表达式
//
//  Created by fans on 15/11/14.
//  Copyright © 2015年 FF. All rights reserved.
//

#import "ViewController.h"
#import "WBAbourtViewController.h"
#import "SimpleCollectionViewCell.h"
#import "Factory.h"

@interface ViewController ()<UIPopoverPresentationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
{
    __weak IBOutlet UITextField *regexField;
    __weak IBOutlet UITextField *inputField;
    __weak IBOutlet UILabel *contentText;
    __weak IBOutlet UICollectionView *collectionV;

    NSArray *regexArr;
    NSArray *titles;
}
- (IBAction)vertificationString:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *selectCompletedRule;
- (IBAction)selectCompletedRule:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViews];
    [self setData];
}
- (void)setViews{
    [collectionV registerClass:[SimpleCollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
}

- (void)setData{
    regexArr = @[kRePhoneNumber,kReString,kReMoneyFormate,kRePassword,kRePIN,kReWeiXin];
    titles = @[@"手机号",@"字符串",@"金钱",@"密码",@"PIN",@"微信"];
}
- (BOOL)verificationContent:(NSString*)string regex:(NSString*)regex{
    NSPredicate * wxPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [wxPredicate evaluateWithObject:string];
}
- (IBAction)vertificationString:(id)sender {
    if ([self verificationContent:inputField.text regex:regexField.text]) {
        contentText.text = @"验证通过";
    }else{
        contentText.text = @"错误";
    }
}
- (IBAction)selectCompletedRule:(id)sender {
    //进入关于界面
    WBAbourtViewController *abourtViewController = [[WBAbourtViewController alloc] initWithNibName:@"WBAbourtViewController" bundle:nil];
    abourtViewController.title = @"关于我们";
    abourtViewController.modalPresentationStyle = UIModalPresentationPopover;

    //pad context
//    UIPopoverController * popVC = [[UIPopoverController alloc]initWithContentViewController:abourtViewController];
//    [popVC presentPopoverFromRect:CGRectMake(0, 0, 50, 20) inView:self.selectCompletedRule permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

//    UIPopoverPresentationController* abourtPopoverController = abourtViewController.popoverPresentationController;
//    abourtPopoverController.barButtonItem = self.selectCompletedRule;
//    abourtPopoverController.permittedArrowDirections = UIPopoverArrowDirectionAny;
//    abourtPopoverController.delegate = self;
    [self presentViewController:abourtViewController animated:YES completion:nil];
}

#define mark collection View delegate
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return titles.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SimpleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.titleLabel.text = titles[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *regesStr = regexArr[indexPath.row];
    regexField.text = regesStr;
}
@end
