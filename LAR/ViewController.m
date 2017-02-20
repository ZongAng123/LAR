//
//  ViewController.m
//  LAR
//
//  Created by 纵昂 on 2017/2/20.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "ViewController.h"
#import "RegistViewController.h"
@interface ViewController ()
@property (nonatomic, strong) UITextField *textField1;
@property (nonatomic, strong) UITextField *textField2;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *registBtn;
@end

@implementation ViewController

/**
 if (textField == self.securityCodeLabel) {
 if (string.length == 0) return YES;
 NSInteger existedLength = textField.text.length;
 NSInteger selectedLength = range.length;
 NSInteger replaceLength = string.length;
 if (existedLength - selectedLength + replaceLength > 11) {
 return NO;
 }
 }
 return YES;
 */

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setSignUI];
    [self.view addSubview:self.button];
    [self.view addSubview:self.textField1];
    [self.view addSubview:self.textField2];
    [self.view addSubview:self.registBtn];
}

#pragma mark - Touch Event

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - Setter Getter

- (UITextField *)textField1 {
    if (!_textField1) {
        _textField1 = [[UITextField alloc] initWithFrame:CGRectMake(100, 160, self.view.bounds.size.width - 116, 40)];
        _textField1.textColor = [UIColor colorWithRed:46 / 255.0 green:50 / 255.0 blue:53 / 255.0 alpha:1];
        _textField1.placeholder = @"请输入用户名";
        _textField1.font = [UIFont systemFontOfSize:16];
        _textField1.keyboardType = UIKeyboardTypeASCIICapable;
        //是否纠错
        _textField1.autocorrectionType = UITextAutocorrectionTypeNo;
        //右边删除按钮
        _textField1.clearButtonMode = UITextFieldViewModeWhileEditing;
        [_textField1 addTarget:self action:@selector(textValueDidChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _textField1;
}

- (UITextField *)textField2 {
    if (!_textField2) {
        _textField2 = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, self.view.bounds.size.width - 116, 40)];
        _textField2.textColor = [UIColor colorWithRed:46 / 255.0 green:50 / 255.0 blue:53 / 255.0 alpha:1];
        _textField2.placeholder = @"请输入登录密码";
        _textField2.font = [UIFont systemFontOfSize:16];
        _textField2.secureTextEntry = YES;
        _textField2.clearButtonMode = UITextFieldViewModeWhileEditing;
        [_textField2 addTarget:self action:@selector(textValueDidChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _textField2;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(16, 255, self.view.bounds.size.width - 32, 40);
        _button.backgroundColor = [UIColor colorWithRed:28 / 255.0 green:171 / 255.0 blue:235 / 255.0 alpha:1];
        [_button setTitle:@"登录" forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:18];
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _button.layer.cornerRadius = 5;
        _button.clipsToBounds = YES;
        _button.enabled = NO;
        [_button setTitleColor:[UIColor colorWithRed:229 / 255.0 green:229 / 255.0 blue:229 / 255.0 alpha:1] forState:UIControlStateDisabled];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _button;
}

- (UIButton *)registBtn {
    if (!_registBtn) {
        _registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _registBtn.frame = CGRectMake(16, self.view.bounds.size.height - 60, self.view.bounds.size.width - 32, 40);
        [_registBtn setTitle:@"没有账号？请注册" forState:UIControlStateNormal];
        _registBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_registBtn addTarget:self action:@selector(registButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _registBtn.layer.cornerRadius = 5;
        _registBtn.clipsToBounds = YES;
        _registBtn.layer.borderWidth = 1.0;
        _registBtn.layer.borderColor = [UIColor colorWithRed:197 / 255.0 green:197 / 255.0 blue:197 / 255.0 alpha:1].CGColor;
        [_registBtn setTitleColor:[UIColor colorWithRed:87 / 255.0 green:108 / 255.0 blue:148 / 255.0 alpha:1] forState:UIControlStateNormal];
    }
    return _registBtn;
}

- (void)setSignUI {
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2 - 40, 64, 80, 80)];
    imgView.image = [UIImage imageNamed:@"1.JPG"];
    imgView.layer.cornerRadius = 5;
    imgView.clipsToBounds = YES;
    [self.view addSubview:imgView];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(16, 160, 80, 40)];
    label1.text = @"账号";
    label1.font = [UIFont systemFontOfSize:16];
    label1.textColor = [UIColor colorWithRed:46 / 255.0 green:40 / 255.0 blue:53 / 255.0 alpha:1];
    [self.view addSubview:label1];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(16, 200, self.view.bounds.size.width - 16, .5)];
    view.backgroundColor = [UIColor colorWithRed:229 / 255.0 green:229 / 255.0 blue:229 / 255.0 alpha:1];
    [self.view addSubview:view];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(16, 200, 80, 40)];
    label2.text = @"密码";
    label2.font = [UIFont systemFontOfSize:16];
    label2.textColor = [UIColor colorWithRed:46 / 255.0 green:40 / 255.0 blue:53 / 255.0 alpha:1];
    [self.view addSubview:label2];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(16, 240, self.view.bounds.size.width - 16, .5)];
    view1.backgroundColor = [UIColor colorWithRed:229 / 255.0 green:229 / 255.0 blue:229 / 255.0 alpha:1];
    [self.view addSubview:view1];
}

#pragma mark - UIButton Action

- (void)registButtonAction:(UIButton *)btn {
    [self.navigationController pushViewController:[[RegistViewController alloc] initWithSuccessBlock:^(NSString *name, NSString *pwd) {
        self.textField1.text = name;
        self.textField2.text = pwd;
        self.button.enabled = YES;
    }] animated:YES];
}

- (void)buttonAction:(UIButton *)btn {
    [self loginRequest:self.textField1.text pwd:self.textField2.text];
}

#pragma mark - HTTP Request

- (void)loginRequest:(NSString *)name pwd:(NSString *)pwd {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:8080/Login/NewServlet?name=%@&pwd=%@&command=2", name, pwd]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        [self performSelectorOnMainThread:@selector(showAlertView:) withObject:str waitUntilDone:NO];
    }];
}

- (void)showAlertView:(NSString *)message {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:ok];
    [self presentViewController:alertVC animated:YES completion:nil];
}

#pragma mark - UITextField Action

- (void)textValueDidChanged:(UITextField *)textField {
    if (_textField1.text.length > 0 && _textField2.text.length) {
        _button.enabled = YES;
    }else {
        _button.enabled = NO;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
