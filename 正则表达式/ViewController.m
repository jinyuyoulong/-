//
//  ViewController.m
//  正则表达式
//
//  Created by fans on 15/11/14.
//  Copyright © 2015年 FF. All rights reserved.
//

#import "ViewController.h"
#import "WBAbourtViewController.h"

@interface ViewController ()<UIPopoverPresentationControllerDelegate>
{
    __weak IBOutlet UITextField *inputField;
    __weak IBOutlet UILabel *contentText;

}
- (IBAction)vertificationString:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *selectCompletedRule;
- (IBAction)selectCompletedRule:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (BOOL)verificationWeiXinContent:(NSString*)string{
    NSString * re = @"[A-Za-z0-9_\u4e00-\u9fa5]{1,100}";
    NSPredicate * wxPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",re];
    return [wxPredicate evaluateWithObject:string];
}
- (IBAction)vertificationString:(id)sender {
    if ([self verificationWeiXinContent:inputField.text]) {
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
    
    UIPopoverController * popVC = [[UIPopoverController alloc]initWithContentViewController:abourtViewController];
    [popVC presentPopoverFromRect:CGRectMake(0, 0, 50, 20) inView:self.selectCompletedRule permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
//    UIPopoverPresentationController* abourtPopoverController = abourtViewController.popoverPresentationController;
////    abourtPopoverController.barButtonItem = self.selectCompletedRule;
//    abourtPopoverController.permittedArrowDirections = UIPopoverArrowDirectionAny;
//    abourtPopoverController.delegate = self;
//    [self presentViewController:abourtViewController animated:YES completion:nil];
}
@end
