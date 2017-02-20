//
//  RegistViewController.m
//  LAR
//
//  Created by 纵昂 on 2017/2/20.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()
@property (nonatomic, copy) RegistSuccessBlock registSuccessBlock;
@property (nonatomic, strong) UITextField *textField1;
@property (nonatomic, strong) UITextField *textField2;
@property (nonatomic, strong) UITextField *textField3;
@property (nonatomic, strong) UITextField *textField4;
@property (nonatomic, strong) UIButton *registBtn;
@property (nonatomic, strong) UIButton *backBtn;

@end

@implementation RegistViewController
/**
 if (textField == self.securityCodeLabel) {
 if (string.length == 0) return YES;
 NSInteger existedLength = textField.text.length;
 NSInteger selectedLength = range.length;
 NSInteger replaceLength = string.length;
 if (existedLength - selectedLength + replaceLength > 4) {
 return NO;
 }
 }
 return YES;
 */
#pragma mark - Life Cycle

- (id)initWithSuccessBlock:(RegistSuccessBlock)registSuccessBlock {
    self = [super init];
    if (self) {
        _registSuccessBlock = registSuccessBlock;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setSignUI];
    [self.view addSubview:self.textField1];
    [self.view addSubview:self.textField2];
    [self.view addSubview:self.textField3];
    [self.view addSubview:self.textField4];
    [self.view addSubview:self.registBtn];
    [self.view addSubview:self.backBtn];
}
#pragma mark - Touch Event

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - Setter Getter

- (UITextField *)textField1 {
    if (!_textField1) {
        _textField1 = [[UITextField alloc] initWithFrame:CGRectMake(100, 140, self.view.bounds.size.width - 116, 40)];
        _textField1.textColor = [UIColor colorWithRed:46 / 255.0 green:50 / 255.0 blue:53 / 255.0 alpha:1];
        _textField1.placeholder = @"请输入账号";
        _textField1.font = [UIFont systemFontOfSize:16];
        _textField1.keyboardType = UIKeyboardTypeASCIICapable;
        _textField1.autocorrectionType = UITextAutocorrectionTypeNo;
        _textField1.clearButtonMode = UITextFieldViewModeWhileEditing;
        [_textField1 addTarget:self action:@selector(textValueDidChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _textField1;
}

- (UITextField *)textField2 {
    if (!_textField2) {
        _textField2 = [[UITextField alloc] initWithFrame:CGRectMake(100, 180, self.view.bounds.size.width - 116, 40)];
        _textField2.textColor = [UIColor colorWithRed:46 / 255.0 green:50 / 255.0 blue:53 / 255.0 alpha:1];
        _textField2.placeholder = @"请输入用户名";
        _textField2.font = [UIFont systemFontOfSize:16];
        _textField2.clearButtonMode = UITextFieldViewModeWhileEditing;
        [_textField2 addTarget:self action:@selector(textValueDidChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _textField2;
}

- (UITextField *)textField3 {
    if (!_textField3) {
        _textField3 = [[UITextField alloc] initWithFrame:CGRectMake(100, 220, self.view.bounds.size.width - 116, 40)];
        _textField3.textColor = [UIColor colorWithRed:46 / 255.0 green:50 / 255.0 blue:53 / 255.0 alpha:1];
        _textField3.placeholder = @"请输入年龄";
        _textField3.font = [UIFont systemFontOfSize:16];
        _textField3.keyboardType = UIKeyboardTypeNumberPad;
        _textField3.autocorrectionType = UITextAutocorrectionTypeNo;
        _textField3.clearButtonMode = UITextFieldViewModeWhileEditing;
        [_textField3 addTarget:self action:@selector(textValueDidChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _textField3;
}

- (UITextField *)textField4 {
    if (!_textField4) {
        _textField4 = [[UITextField alloc] initWithFrame:CGRectMake(100, 260, self.view.bounds.size.width - 116, 40)];
        _textField4.textColor = [UIColor colorWithRed:46 / 255.0 green:50 / 255.0 blue:53 / 255.0 alpha:1];
        _textField4.placeholder = @"请输入登录密码";
        _textField4.font = [UIFont systemFontOfSize:16];
        _textField4.secureTextEntry = YES;
        _textField4.clearButtonMode = UITextFieldViewModeWhileEditing;
        [_textField4 addTarget:self action:@selector(textValueDidChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _textField4;
}


- (UIButton *)registBtn {
    if (!_registBtn) {
        _registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _registBtn.frame = CGRectMake(16, 315, self.view.bounds.size.width - 32, 40);
        _registBtn.backgroundColor = [UIColor colorWithRed:28 / 255.0 green:171 / 255.0 blue:235 / 255.0 alpha:1];
        [_registBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_registBtn addTarget:self action:@selector(registButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _registBtn.layer.cornerRadius = 5;
        _registBtn.clipsToBounds = YES;
        _registBtn.enabled = NO;
        [_registBtn setTitleColor:[UIColor colorWithRed:229 / 255.0 green:229 / 255.0 blue:229 / 255.0 alpha:1] forState:UIControlStateDisabled];
        [_registBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _registBtn;
}

- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.frame = CGRectMake(16, 30, 40, 30);
        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        _backBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_backBtn addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_backBtn setTitleColor:[UIColor colorWithRed:28 / 255.0 green:171 / 255.0 blue:235 / 255.0 alpha:1] forState:UIControlStateNormal];
    }
    return _backBtn;
}


- (void)setSignUI {
    UILabel *signLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 64, self.view.bounds.size.width - 32, 60)];
    signLabel.text = @"请设置个人基本资料";
    signLabel.font = [UIFont systemFontOfSize:18];
    signLabel.textAlignment = NSTextAlignmentCenter;
    signLabel.textColor = [UIColor colorWithRed:46 / 255.0 green:40 / 255.0 blue:53 / 255.0 alpha:1];
    [self.view addSubview:signLabel];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(16, 140, 80, 40)];
    label1.text = @"账号";
    label1.font = [UIFont systemFontOfSize:16];
    label1.textColor = [UIColor colorWithRed:46 / 255.0 green:40 / 255.0 blue:53 / 255.0 alpha:1];
    [self.view addSubview:label1];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(16, 180, self.view.bounds.size.width - 16, .5)];
    view.backgroundColor = [UIColor colorWithRed:229 / 255.0 green:229 / 255.0 blue:229 / 255.0 alpha:1];
    [self.view addSubview:view];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(16, 180, 80, 40)];
    label2.text = @"姓名";
    label2.font = [UIFont systemFontOfSize:16];
    label2.textColor = [UIColor colorWithRed:46 / 255.0 green:40 / 255.0 blue:53 / 255.0 alpha:1];
    [self.view addSubview:label2];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(16, 220, self.view.bounds.size.width - 16, .5)];
    view1.backgroundColor = [UIColor colorWithRed:229 / 255.0 green:229 / 255.0 blue:229 / 255.0 alpha:1];
    [self.view addSubview:view1];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(16, 220, 80, 40)];
    label3.text = @"年龄";
    label3.font = [UIFont systemFontOfSize:16];
    label3.textColor = [UIColor colorWithRed:46 / 255.0 green:40 / 255.0 blue:53 / 255.0 alpha:1];
    [self.view addSubview:label3];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(16, 260, self.view.bounds.size.width - 16, .5)];
    view3.backgroundColor = [UIColor colorWithRed:229 / 255.0 green:229 / 255.0 blue:229 / 255.0 alpha:1];
    [self.view addSubview:view3];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(16, 260, 80, 40)];
    label4.text = @"密码";
    label4.font = [UIFont systemFontOfSize:16];
    label4.textColor = [UIColor colorWithRed:46 / 255.0 green:40 / 255.0 blue:53 / 255.0 alpha:1];
    [self.view addSubview:label4];
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(16, 300, self.view.bounds.size.width - 16, .5)];
    view4.backgroundColor = [UIColor colorWithRed:229 / 255.0 green:229 / 255.0 blue:229 / 255.0 alpha:1];
    [self.view addSubview:view4];
}

#pragma mark - UIButton Action

- (void)backButtonAction:(UIButton *)btn {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)registButtonAction:(UIButton *)btn {
    [self registRequest:self.textField1.text trueName:self.textField2.text age:self.textField3.text pwd:self.textField4.text];
}

#pragma mark - HTTP Request

- (void)registRequest:(NSString *)name trueName:(NSString *)trueName age:(NSString *)age pwd:(NSString *)pwd {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:8080/Login/NewServlet?name=%@&age=%@&trueName=%@&pwd=%@&command=1", name, age, trueName, pwd]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        [self performSelectorOnMainThread:@selector(showAlertView:) withObject:str waitUntilDone:NO];
    }];
}

- (void)showAlertView:(NSString *)message {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (self.registSuccessBlock) {
            self.registSuccessBlock(_textField1.text, _textField4.text);
        }
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alertVC addAction:ok];
    [self presentViewController:alertVC animated:YES completion:nil];
}

#pragma mark - UITextField Action

- (void)textValueDidChanged:(UITextField *)textField {
    if (_textField1.text.length > 0 && _textField2.text.length > 0 && _textField3.text.length > 0 && _textField4.text.length > 0) {
        _registBtn.enabled = YES;
    }else {
        _registBtn.enabled = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
