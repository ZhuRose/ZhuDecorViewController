# -*- coding: utf-8 -*-
#!/usr/bin/python

import sys, getopt, json, time
reload(sys)
sys.setdefaultencoding('utf8')

'''
layout合法的属性：
left; top; right; bottom; width; height; centerX; centerY
params合法的属性:
color "#ffffff"
alpha [0, 1]
visible true/false
corner 10
borderColor "#ffffff"
borderWidth 1
(label input)
text "text"
textColor #ffffff
textSize 20
textAlign left/center/right
(imageView button)
image "img"(本地图片名称)
(input button)
enabled true/false
(input)
placeholder "ph"
inputVisible true/false
(button很特殊)
text "123"
textColor "#000000"
textSize 18
image "image"
'''

tag_base = 10
user_name = 'ZhuRose'
type_table = {
    'view': 'UIView',
    'label': 'UILabel',
    'imageview': 'UIImageView',
    'button': 'UIButton',
    'input': 'UITextField'
}

layout_set = ('left', 'top', 'right', 'bottom', 'width', 'height', 'centerX', 'centerY')

param_table = {
    'color': ('backgroundColor', '[UIColor colorWithHexString:@"#" alpha:1]'),
    'alpha': ('alpha', '#'),
    'visible': ('hidden', '#'),
    'corner': ('layer.cornerRadius', '#'),
    'borderColor': ('layer.borderColor', '[UIColor colorWithHexString:@"#" alpha:1].CGColor'),
    'borderWidth': ('layer.borderWidth', '#'),
    #label input
    'text': ('text', '@"#"'),
    'textColor': ('textColor', '[UIColor colorWithHexString:@"#" alpha:1]'),
    'textSize': ('font', '[UIFont systemFontOfSize:#]'),
    'textAlign': ('textAlignment', 'NSTextAlignment#'),
    #imageview
    'image': ('image', '[UIImage imageNamed:@"#"]'),
    #input button
    'enabled': ('enabled', '#'),
    #input
    'placeholder': ('placeholder', '@"#"'),
    "inputVisible": ('secureTextEntry', '#')
}

def parseParam(name_str, param_key, param_value, type_str):
    oc_str = '\n    '
    #特殊处理button的几个属性
    if type_str == 'UIButton' and param_key in ('text', 'textColor', 'textSize', 'image'):
        if param_key == 'text':
            oc_str += '[%s setTitle:@"%s" forState:UIControlStateNormal];' % (name_str, param_value)
        elif param_key == 'textColor':
            oc_str += '[%s setTitleColor:[UIColor colorWithHexString:@"%s" alpha:1] forState:UIControlStateNormal];' % (name_str, param_value)
        elif param_key == 'textSize':
            oc_str += '%s.titleLabel.font = [UIFont systemFontOfSize:%d];' % (name_str, param_value)
        elif param_key == 'image':
            oc_str += '[%s setBackgroundImage:[UIImage imageNamed:@"%s"] forState:UIControlStateNormal];' % (name_str, param_value)
        return oc_str
    param_name, value_str = param_table[param_key]
    if param_key in ('visible', 'inputVisible'):
        ph_str = 'NO' if param_value else "YES"
    elif param_key == 'enabled':
        ph_str = 'YES' if param_value else "NO"
    elif param_key == 'textAlign':
        ph_str = param_value[:1].upper() + param_value[1:]
    else:
        ph_str = str(param_value)
    oc_str += '%s.%s = %s;' % (name_str, param_name, value_str.replace('#', ph_str, 1))
    return oc_str

def ocStrWithParams(name_str, params_dict, type_str):
    oc_str = '\n    //params'
    for key, value in params_dict.items():
        if key not in param_table.keys():
            continue
        oc_str += parseParam(name_str, key, value, type_str)
    return oc_str

def parseLayout(name_str, layout_key, layout_value, litem_name):
    oc_str = '\n    '
    attr_str = layout_key[:1].upper() + layout_key[1:]
    item_name = 'self.contentView'
    item_attr = attr_str
    constant_num = layout_value
    owner_name = 'self.contentView'
    if attr_str == 'Left' and litem_name != 'self.contentView':
        item_name = litem_name
        item_attr = 'Right'
    elif attr_str in ('Bottom', 'Right'):
        constant_num = -constant_num
    elif attr_str in ('Width', 'Height'):
        item_name = 'nil'
        item_attr = 'NotAnAttribute'
        owner_name = name_str
    oc_str += 'NSLayoutConstraint *%sConstraint = [NSLayoutConstraint constraintWithItem:%s attribute:NSLayoutAttribute%s ' \
              'relatedBy:NSLayoutRelationEqual toItem:%s attribute:NSLayoutAttribute%s multiplier:1 constant:%d];' \
              % (layout_key, name_str, attr_str, item_name, item_attr, constant_num)
    oc_str += '\n    [%s addConstraint:%sConstraint];' % (owner_name, layout_key)
    return oc_str

#litem_name 左边控件名称'_item'
def ocStrWithLayout(name_str, layout_dict, item_tag):
    oc_str = '\n    //layout'
    oc_str += '\n    %s.translatesAutoresizingMaskIntoConstraints = NO;' % name_str
    #左边item存在且计算了left的距离
    item_name = 'self.contentView'
    if item_tag >= tag_base and 'left' in layout_dict.keys():
        oc_str += '\n    UIView *itemView = [self.contentView viewWithTag:%d];' % item_tag
        item_name = 'itemView'
    for key, value in layout_dict.items():
        if key not in layout_set:
            continue
        oc_str += parseLayout(name_str, key, value, item_name)
    return oc_str

def funcStrWithCreateSubview(subview_dict, index):
    type_str = type_table[subview_dict['type']]
    name_str = subview_dict['name']
    item_index = subview_dict['item'] if "item" in subview_dict.keys() and subview_dict['item'] < index else index - 1
    layout_dict = subview_dict['layout']
    params_dict = subview_dict['params']
    #方法名
    func_str = 'create%s' % (name_str[:1].upper() + name_str[1:])
    oc_str = '\n- (void)%s {' % func_str
    oc_str += '\n    %s *%s = [[%s alloc] init];' % (type_str, name_str, type_str)
    oc_str += '\n    [self.contentView addSubview:%s];' % name_str
    #给创建的subview设置tag = tag_base + index
    oc_str += '\n    %s.tag = %d;' % (name_str, tag_base + index)
    oc_str += ocStrWithLayout(name_str, layout_dict, tag_base + item_index)
    oc_str += ocStrWithParams(name_str, params_dict, type_str)
    oc_str += '\n    //assign'
    oc_str += '\n    _%s = %s;' % (name_str, name_str)
    oc_str += '\n}'
    return func_str, oc_str

def ocStrWithAnnotations(name_str):
    # 获取当前时间
    local_time = time.localtime(time.time())
    year_str = '%d' % local_time.tm_year
    mon_str = '%d' % local_time.tm_mon
    mday_str = '%d' % local_time.tm_mday
    # 开始注入注释
    oc_str = '//\n//  %s.h\n//\n//\n//  Created by %s on %s/%s/%s.' % (
        name_str, user_name, year_str, mon_str, mday_str)
    oc_str += '\n//  Copyright © %s年 %s. All rights reserved.\n//' % (year_str, user_name)
    return oc_str

def createOutputfile_m(name_str, subviews_list, init_str):
    # 创建.m文件
    foc = open('%s.m' % name_str, 'wb+')
    oc_str = ocStrWithAnnotations(name_str)
    oc_str += '\n\n#import "%s.h"' % name_str
    oc_str += '\n\n@interface %s ()' % name_str
    oc_str += '\n'
    #声明属性
    for subview in subviews_list:
        oc_str += '\n@property (nonatomic, strong) %s *%s;' % (type_table[subview['type']], subview['name'])
    oc_str += '\n\n@end'
    oc_str += '\n\n@implementation %s' % name_str
    oc_str += '\n'
    # 初始化方法
    func_list = []
    func_oc_str = ''
    for index, subview in enumerate(subviews_list):
        func_name, func_str = funcStrWithCreateSubview(subview, index)
        func_list.append(func_name)
        func_oc_str += '\n'
        func_oc_str += func_str
    oc_str += init_str
    for fs in func_list:
        oc_str += '\n        [self %s];' % fs
    oc_str += '\n    }'
    oc_str += '\n    return self;'
    oc_str += '\n}'
    oc_str += func_oc_str
    oc_str += '\n\n@end'
    foc.write(oc_str)
    foc.close()

def createOutputfile_h(name_str, fcls_str):
    # 创建.h文件
    foc = open('%s.h' % name_str, 'wb+')
    oc_str = ocStrWithAnnotations(name_str)
    oc_str += '\n\n#import "%s.h"' % fcls_str
    oc_str += '\n\n@interface %s : %s' % (name_str, fcls_str)
    oc_str += '\n\n@end'
    foc.write(oc_str)
    foc.close()

def createOutputfile(json_dict):
    name_str = json_dict['name']
    type_str = json_dict['type']
    fcls_str = 'ZhuCustomCell' if type_str == 'cell' else 'ZhuCustomView'
    init_str = '\n- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {' \
               '\n    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {' \
        if type_str == 'cell' else '\n- (instancetype)init {\n    if (self = [super init]) {'
    subviews_list = json_dict['subviews']
    createOutputfile_h(name_str, fcls_str)
    createOutputfile_m(name_str, subviews_list, init_str)
    print 'success'

def parseJson(input_file):
    json_file = open(input_file, 'r')
    json_dict = json.load(json_file)
    json_file.close()
    return json_dict

def main(options):
    input_file = ''
    for opt, arg in options:
        if opt in ('-h', '--help'):
            print 'test.py -i <inputfile>'
            sys.exit()
        elif opt in ('-i', '--ifile'):
            input_file = arg
    json_dict = parseJson(input_file)
    print json_dict
    createOutputfile(json_dict)

if __name__ == '__main__':
    try:
         options, args = getopt.getopt(sys.argv[1:], 'hi:',['help', 'ifile='])
         print options
         print args
#        options = [('-i', './test5.json')]
         main(options)
    except getopt.GetoptError:
        sys.exit()


