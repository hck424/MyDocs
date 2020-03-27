//
//  Constants.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/19.
//  Copyright © 2020 김학철. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

typedef NS_ENUM(NSUInteger, LIST_TYPE) {
    LIST_TYPE_TABLE,
    LIST_TYPE_COLLECTION
};

typedef NS_ENUM(NSUInteger, ToolBarType) {
    ToolBarTypeDefault,
    ToolBarTypeDelete,
};

typedef NS_ENUM(NSUInteger, TAG_TOOL_BTN) {
    TAG_TOOL_BTN_SELECT = 11111,
    TAG_TOOL_BTN_SORT,
    TAG_TOOL_BTN_NEWFOLDER,
    TAG_TOOL_BTN_ADDFILES,
    TAG_TOOL_BTN_DELETE,
};

typedef NS_ENUM(NSUInteger, FILE_SORT_TYPE) {
    FILE_SORT_TYPE_NAME,
    FILE_SORT_TYPE_SIZE,
    FILE_SORT_TYPE_CREATE_DATE,
    FILE_SORT_TYPE_MODI_DATE,
    FILE_SORT_TYPE_ITEM_COUNT
};


#endif /* Constants_h */
