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

typedef NS_ENUM(NSUInteger, TOOL_BAR_ACTION) {
    TOOL_BAR_ACTION_SELECT = 10,
    TOOL_BAR_ACTION_NEWFOLDER,
    TOOL_BAR_ACTION_ADDFILES,
    TOOL_BAR_ACTION_DELETE,
    TOOL_BAR_ACTION_CAMERA,
    TOOL_BAR_ACTION_SHARE,
    TOOL_BAR_ACTION_CLOUD_UPLOAD,
    TOOL_BAR_ACTION_COPY,
    TOOL_BAR_ACTION_MOVE,
    TOOL_BAR_ACTION_PHOTO,
    TOOL_BAR_ACTION_ADD_SONG,
    TOOL_BAR_ACTION_CLOUD_DOWNLOAD
};

typedef NS_ENUM(NSUInteger, FILE_SORT_TYPE) {
    FILE_SORT_TYPE_NAME,
    FILE_SORT_TYPE_SIZE,
    FILE_SORT_TYPE_CREATE_DATE,
    FILE_SORT_TYPE_MODI_DATE,
    FILE_SORT_TYPE_ITEM_COUNT
};

typedef NS_ENUM(NSUInteger, CELL_TYPE) {
    CELL_TYPE_DEFAULT,
    CELL_TYPE_SELECTION
};

#endif /* Constants_h */
