

cdef extern from "/opt/vc/include/VG/openvg.h":
    ctypedef float          _VGfloat "VGfloat"
    ctypedef signed char    _VGbyte "VGbyte"
    ctypedef unsigned char  _VGubyte "VGbyte"
    ctypedef signed short   _VGshort "VGshort"
    ctypedef signed int     _VGint "VGint"
    ctypedef unsigned int   _VGuint "VGuint"
    ctypedef unsigned int   _VGbitfield "VGbitfield"
    
    ctypedef _VGuint _VGHandle "VGHandle"
    ctypedef _VGHandle _VGPath "VGPath"
    ctypedef _VGHandle _VGImage "VGImage"
    ctypedef _VGHandle _VGMaskLayer "VGMaskLayer"
    ctypedef _VGHandle _VGFont "VGFont"
    ctypedef _VGHandle _VGPaint "VGPaint"
    
    enum:
        VG_MAX_ENUM = 0x7FFFFFFF
        VG_MAXINT = 0x7FFFFFFF
        VG_MAXSHORT = 0x7FFF
        VG_PATH_FORMAT_STANDARD = 0
        
    ctypedef enum _VGboolean "VGboolean":
        VG_FALSE = 0
        VG_TRUE = 1
        VG_BOOLEAN_FORCE_SIZE  = VG_MAX_ENUM
        
    ctypedef enum _VGPaintMode "VGPaintMode":
        VG_STROKE_PATH                              = (1 << 0)
        VG_FILL_PATH                                = (1 << 1)
        VG_PAINT_MODE_FORCE_SIZE                    = VG_MAX_ENUM
    
    ctypedef enum _VGPathDatatype "VGPathDatatype":
        VG_PATH_DATATYPE_S_8                        =  0
        VG_PATH_DATATYPE_S_16                       =  1
        VG_PATH_DATATYPE_S_32                       =  2
        VG_PATH_DATATYPE_F                          =  3
        VG_PATH_DATATYPE_FORCE_SIZE                 = VG_MAX_ENUM
        
    ctypedef enum _VGPathCapabilities "VGPathCapabilities":
        VG_PATH_CAPABILITY_APPEND_FROM              = (1 <<  0)
        VG_PATH_CAPABILITY_APPEND_TO                = (1 <<  1)
        VG_PATH_CAPABILITY_MODIFY                   = (1 <<  2)
        VG_PATH_CAPABILITY_TRANSFORM_FROM           = (1 <<  3)
        VG_PATH_CAPABILITY_TRANSFORM_TO             = (1 <<  4)
        VG_PATH_CAPABILITY_INTERPOLATE_FROM         = (1 <<  5)
        VG_PATH_CAPABILITY_INTERPOLATE_TO           = (1 <<  6)
        VG_PATH_CAPABILITY_PATH_LENGTH              = (1 <<  7)
        VG_PATH_CAPABILITY_POINT_ALONG_PATH         = (1 <<  8)
        VG_PATH_CAPABILITY_TANGENT_ALONG_PATH       = (1 <<  9)
        VG_PATH_CAPABILITY_PATH_BOUNDS              = (1 << 10)
        VG_PATH_CAPABILITY_PATH_TRANSFORMED_BOUNDS  = (1 << 11)
        VG_PATH_CAPABILITY_ALL                      = (1 << 12) - 1

        VG_PATH_CAPABILITIES_FORCE_SIZE             = VG_MAX_ENUM

    ctypedef enum _VGErrorCode  "VGErrorCode":
        VG_NO_ERROR                                 = 0
        VG_BAD_HANDLE_ERROR                         = 0x1000
        VG_ILLEGAL_ARGUMENT_ERROR                   = 0x1001
        VG_OUT_OF_MEMORY_ERROR                      = 0x1002
        VG_PATH_CAPABILITY_ERROR                    = 0x1003
        VG_UNSUPPORTED_IMAGE_FORMAT_ERROR           = 0x1004
        VG_UNSUPPORTED_PATH_FORMAT_ERROR            = 0x1005
        VG_IMAGE_IN_USE_ERROR                       = 0x1006
        VG_NO_CONTEXT_ERROR                         = 0x1007
        VG_ERROR_CODE_FORCE_SIZE                    = VG_MAX_ENUM

    ctypedef enum _VGParamType "VGParamType":
        ###/* Mode settings */
        VG_MATRIX_MODE                              = 0x1100
        VG_FILL_RULE                                = 0x1101
        VG_IMAGE_QUALITY                            = 0x1102
        VG_RENDERING_QUALITY                        = 0x1103
        VG_BLEND_MODE                               = 0x1104
        VG_IMAGE_MODE                               = 0x1105
        ###/* Scissoring rectangles */
        VG_SCISSOR_RECTS                            = 0x1106
        ###/* Color Transformation */
        VG_COLOR_TRANSFORM                          = 0x1170
        VG_COLOR_TRANSFORM_VALUES                   = 0x1171
        ###/* Stroke parameters */
        VG_STROKE_LINE_WIDTH                        = 0x1110
        VG_STROKE_CAP_STYLE                         = 0x1111
        VG_STROKE_JOIN_STYLE                        = 0x1112
        VG_STROKE_MITER_LIMIT                       = 0x1113
        VG_STROKE_DASH_PATTERN                      = 0x1114
        VG_STROKE_DASH_PHASE                        = 0x1115
        VG_STROKE_DASH_PHASE_RESET                  = 0x1116
        ###/* Edge fill color for VG_TILE_FILL tiling mode */
        VG_TILE_FILL_COLOR                          = 0x1120
        ###/* Color for vgClear */
        VG_CLEAR_COLOR                              = 0x1121
        ###/* Glyph origin */
        VG_GLYPH_ORIGIN                             = 0x1122
        ###/* Enable/disable alpha masking and scissoring */
        VG_MASKING                                  = 0x1130
        VG_SCISSORING                               = 0x1131
        ###/* Pixel layout information */
        VG_PIXEL_LAYOUT                             = 0x1140
        VG_SCREEN_LAYOUT                            = 0x1141
        ###/* Source format selection for image filters */
        VG_FILTER_FORMAT_LINEAR                     = 0x1150
        VG_FILTER_FORMAT_PREMULTIPLIED              = 0x1151
        ###/* Destination write enable mask for image filters */
        VG_FILTER_CHANNEL_MASK                      = 0x1152
        ###/* Implementation limits (read-only) */
        VG_MAX_SCISSOR_RECTS                        = 0x1160
        VG_MAX_DASH_COUNT                           = 0x1161
        VG_MAX_KERNEL_SIZE                          = 0x1162
        VG_MAX_SEPARABLE_KERNEL_SIZE                = 0x1163
        VG_MAX_COLOR_RAMP_STOPS                     = 0x1164
        VG_MAX_IMAGE_WIDTH                          = 0x1165
        VG_MAX_IMAGE_HEIGHT                         = 0x1166
        VG_MAX_IMAGE_PIXELS                         = 0x1167
        VG_MAX_IMAGE_BYTES                          = 0x1168
        VG_MAX_FLOAT                                = 0x1169
        VG_MAX_GAUSSIAN_STD_DEVIATION               = 0x116A
        VG_PARAM_TYPE_FORCE_SIZE                    = VG_MAX_ENUM

    ctypedef enum _VGRenderingQuality  "VGRenderingQuality":
        VG_RENDERING_QUALITY_NONANTIALIASED         = 0x1200
        VG_RENDERING_QUALITY_FASTER                 = 0x1201
        VG_RENDERING_QUALITY_BETTER                 = 0x1202 ###/* Default */
        VG_RENDERING_QUALITY_FORCE_SIZE             = VG_MAX_ENUM

    ctypedef enum _VGPixelLayout "VGPixelLayout":
        VG_PIXEL_LAYOUT_UNKNOWN                     = 0x1300
        VG_PIXEL_LAYOUT_RGB_VERTICAL                = 0x1301
        VG_PIXEL_LAYOUT_BGR_VERTICAL                = 0x1302
        VG_PIXEL_LAYOUT_RGB_HORIZONTAL              = 0x1303
        VG_PIXEL_LAYOUT_BGR_HORIZONTAL              = 0x1304
        VG_PIXEL_LAYOUT_FORCE_SIZE                  = VG_MAX_ENUM

    ctypedef enum _VGMatrixMode "VGMatrixMode":
        VG_MATRIX_PATH_USER_TO_SURFACE              = 0x1400
        VG_MATRIX_IMAGE_USER_TO_SURFACE             = 0x1401
        VG_MATRIX_FILL_PAINT_TO_USER                = 0x1402
        VG_MATRIX_STROKE_PAINT_TO_USER              = 0x1403
        VG_MATRIX_GLYPH_USER_TO_SURFACE             = 0x1404
        VG_MATRIX_MODE_FORCE_SIZE                   = VG_MAX_ENUM

    ctypedef enum _VGMaskOperation "VGMaskOperation":
        VG_CLEAR_MASK                               = 0x1500
        VG_FILL_MASK                                = 0x1501
        VG_SET_MASK                                 = 0x1502
        VG_UNION_MASK                               = 0x1503
        VG_INTERSECT_MASK                           = 0x1504
        VG_SUBTRACT_MASK                            = 0x1505
        VG_MASK_OPERATION_FORCE_SIZE                = VG_MAX_ENUM

    ctypedef enum _VGPathAbsRel "VGPathAbsRel":
        VG_ABSOLUTE                                 = 0
        VG_RELATIVE                                 = 1
        VG_PATH_ABS_REL_FORCE_SIZE                  = VG_MAX_ENUM

    ctypedef enum _VGPathSegment "VGPathSegment":
        VG_CLOSE_PATH                               = ( 0 << 1)
        VG_MOVE_TO                                  = ( 1 << 1)
        VG_LINE_TO                                  = ( 2 << 1)
        VG_HLINE_TO                                 = ( 3 << 1)
        VG_VLINE_TO                                 = ( 4 << 1)
        VG_QUAD_TO                                  = ( 5 << 1)
        VG_CUBIC_TO                                 = ( 6 << 1)
        VG_SQUAD_TO                                 = ( 7 << 1)
        VG_SCUBIC_TO                                = ( 8 << 1)
        VG_SCCWARC_TO                               = ( 9 << 1)
        VG_SCWARC_TO                                = (10 << 1)
        VG_LCCWARC_TO                               = (11 << 1)
        VG_LCWARC_TO                                = (12 << 1)
        VG_PATH_SEGMENT_FORCE_SIZE                  = VG_MAX_ENUM

    ctypedef enum _VGPathCommand  "VGPathCommand":
        VG_MOVE_TO_ABS                              = VG_MOVE_TO    | VG_ABSOLUTE
        VG_MOVE_TO_REL                              = VG_MOVE_TO    | VG_RELATIVE
        VG_LINE_TO_ABS                              = VG_LINE_TO    | VG_ABSOLUTE
        VG_LINE_TO_REL                              = VG_LINE_TO    | VG_RELATIVE
        VG_HLINE_TO_ABS                             = VG_HLINE_TO   | VG_ABSOLUTE
        VG_HLINE_TO_REL                             = VG_HLINE_TO   | VG_RELATIVE
        VG_VLINE_TO_ABS                             = VG_VLINE_TO   | VG_ABSOLUTE
        VG_VLINE_TO_REL                             = VG_VLINE_TO   | VG_RELATIVE
        VG_QUAD_TO_ABS                              = VG_QUAD_TO    | VG_ABSOLUTE
        VG_QUAD_TO_REL                              = VG_QUAD_TO    | VG_RELATIVE
        VG_CUBIC_TO_ABS                             = VG_CUBIC_TO   | VG_ABSOLUTE
        VG_CUBIC_TO_REL                             = VG_CUBIC_TO   | VG_RELATIVE
        VG_SQUAD_TO_ABS                             = VG_SQUAD_TO   | VG_ABSOLUTE
        VG_SQUAD_TO_REL                             = VG_SQUAD_TO   | VG_RELATIVE
        VG_SCUBIC_TO_ABS                            = VG_SCUBIC_TO  | VG_ABSOLUTE
        VG_SCUBIC_TO_REL                            = VG_SCUBIC_TO  | VG_RELATIVE
        VG_SCCWARC_TO_ABS                           = VG_SCCWARC_TO | VG_ABSOLUTE
        VG_SCCWARC_TO_REL                           = VG_SCCWARC_TO | VG_RELATIVE
        VG_SCWARC_TO_ABS                            = VG_SCWARC_TO  | VG_ABSOLUTE
        VG_SCWARC_TO_REL                            = VG_SCWARC_TO  | VG_RELATIVE
        VG_LCCWARC_TO_ABS                           = VG_LCCWARC_TO | VG_ABSOLUTE
        VG_LCCWARC_TO_REL                           = VG_LCCWARC_TO | VG_RELATIVE
        VG_LCWARC_TO_ABS                            = VG_LCWARC_TO  | VG_ABSOLUTE
        VG_LCWARC_TO_REL                            = VG_LCWARC_TO  | VG_RELATIVE
        VG_PATH_COMMAND_FORCE_SIZE                  = VG_MAX_ENUM


    ctypedef enum _VGPathParamType "VGPathParamType":
        VG_PATH_FORMAT                              = 0x1600
        VG_PATH_DATATYPE                            = 0x1601
        VG_PATH_SCALE                               = 0x1602
        VG_PATH_BIAS                                = 0x1603
        VG_PATH_NUM_SEGMENTS                        = 0x1604
        VG_PATH_NUM_COORDS                          = 0x1605
        VG_PATH_PARAM_TYPE_FORCE_SIZE               = VG_MAX_ENUM

    ctypedef enum _VGCapStyle "VGCapStyle":
        VG_CAP_BUTT                                 = 0x1700
        VG_CAP_ROUND                                = 0x1701
        VG_CAP_SQUARE                               = 0x1702
        VG_CAP_STYLE_FORCE_SIZE                     = VG_MAX_ENUM

    ctypedef enum _VGJoinStyle "VGJoinStyle":
        VG_JOIN_MITER                               = 0x1800
        VG_JOIN_ROUND                               = 0x1801
        VG_JOIN_BEVEL                               = 0x1802
        VG_JOIN_STYLE_FORCE_SIZE                    = VG_MAX_ENUM

    ctypedef enum _VGFillRule "VGFillRule":
        VG_EVEN_ODD                                 = 0x1900
        VG_NON_ZERO                                 = 0x1901
        VG_FILL_RULE_FORCE_SIZE                     = VG_MAX_ENUM

    ctypedef enum _VGPaintParamType "VGPaintParamType":
        ###/* Color paint parameters */
        VG_PAINT_TYPE                               = 0x1A00
        VG_PAINT_COLOR                              = 0x1A01
        VG_PAINT_COLOR_RAMP_SPREAD_MODE             = 0x1A02
        VG_PAINT_COLOR_RAMP_PREMULTIPLIED           = 0x1A07
        VG_PAINT_COLOR_RAMP_STOPS                   = 0x1A03
        ###/* Linear gradient paint parameters */
        VG_PAINT_LINEAR_GRADIENT                    = 0x1A04
        ###/* Radial gradient paint parameters */
        VG_PAINT_RADIAL_GRADIENT                    = 0x1A05
        ###/* Pattern paint parameters */
        VG_PAINT_PATTERN_TILING_MODE                = 0x1A06
        VG_PAINT_PARAM_TYPE_FORCE_SIZE              = VG_MAX_ENUM

    ctypedef enum _VGPaintType "VGPaintType":
        VG_PAINT_TYPE_COLOR                         = 0x1B00
        VG_PAINT_TYPE_LINEAR_GRADIENT               = 0x1B01
        VG_PAINT_TYPE_RADIAL_GRADIENT               = 0x1B02
        VG_PAINT_TYPE_PATTERN                       = 0x1B03
        VG_PAINT_TYPE_FORCE_SIZE                    = VG_MAX_ENUM

    ctypedef enum _VGColorRampSpreadMode "VGColorRampSpreadMode":
        VG_COLOR_RAMP_SPREAD_PAD                    = 0x1C00
        VG_COLOR_RAMP_SPREAD_REPEAT                 = 0x1C01
        VG_COLOR_RAMP_SPREAD_REFLECT                = 0x1C02
        VG_COLOR_RAMP_SPREAD_MODE_FORCE_SIZE        = VG_MAX_ENUM

    ctypedef enum _VGTilingMode "VGTilingMode":
        VG_TILE_FILL                                = 0x1D00
        VG_TILE_PAD                                 = 0x1D01
        VG_TILE_REPEAT                              = 0x1D02
        VG_TILE_REFLECT                             = 0x1D03
        VG_TILING_MODE_FORCE_SIZE                   = VG_MAX_ENUM

    ctypedef enum _VGImageFormat "VGImageFormat":
        ###/* RGB{A,X} channel ordering */
        VG_sRGBX_8888                               =  0
        VG_sRGBA_8888                               =  1
        VG_sRGBA_8888_PRE                           =  2
        VG_sRGB_565                                 =  3
        VG_sRGBA_5551                               =  4
        VG_sRGBA_4444                               =  5
        VG_sL_8                                     =  6
        VG_lRGBX_8888                               =  7
        VG_lRGBA_8888                               =  8
        VG_lRGBA_8888_PRE                           =  9
        VG_lL_8                                     = 10
        VG_A_8                                      = 11
        VG_BW_1                                     = 12
        VG_A_1                                      = 13
        VG_A_4                                      = 14
        ###/* {A,X}RGB channel ordering */
        VG_sXRGB_8888                               =  0 | (1 << 6)
        VG_sARGB_8888                               =  1 | (1 << 6)
        VG_sARGB_8888_PRE                           =  2 | (1 << 6)
        VG_sARGB_1555                               =  4 | (1 << 6)
        VG_sARGB_4444                               =  5 | (1 << 6)
        VG_lXRGB_8888                               =  7 | (1 << 6)
        VG_lARGB_8888                               =  8 | (1 << 6)
        VG_lARGB_8888_PRE                           =  9 | (1 << 6)
        ###/* BGR{A,X} channel ordering */
        VG_sBGRX_8888                               =  0 | (1 << 7)
        VG_sBGRA_8888                               =  1 | (1 << 7)
        VG_sBGRA_8888_PRE                           =  2 | (1 << 7)
        VG_sBGR_565                                 =  3 | (1 << 7)
        VG_sBGRA_5551                               =  4 | (1 << 7)
        VG_sBGRA_4444                               =  5 | (1 << 7)
        VG_lBGRX_8888                               =  7 | (1 << 7)
        VG_lBGRA_8888                               =  8 | (1 << 7)
        VG_lBGRA_8888_PRE                           =  9 | (1 << 7)
        ###/* {A,X}BGR channel ordering */
        VG_sXBGR_8888                               =  0 | (1 << 6) | (1 << 7)
        VG_sABGR_8888                               =  1 | (1 << 6) | (1 << 7)
        VG_sABGR_8888_PRE                           =  2 | (1 << 6) | (1 << 7)
        VG_sABGR_1555                               =  4 | (1 << 6) | (1 << 7)
        VG_sABGR_4444                               =  5 | (1 << 6) | (1 << 7)
        VG_lXBGR_8888                               =  7 | (1 << 6) | (1 << 7)
        VG_lABGR_8888                               =  8 | (1 << 6) | (1 << 7)
        VG_lABGR_8888_PRE                           =  9 | (1 << 6) | (1 << 7)
        VG_IMAGE_FORMAT_FORCE_SIZE                  = VG_MAX_ENUM

    ctypedef enum _VGImageQuality "VGImageQuality":
        VG_IMAGE_QUALITY_NONANTIALIASED             = (1 << 0)
        VG_IMAGE_QUALITY_FASTER                     = (1 << 1)
        VG_IMAGE_QUALITY_BETTER                     = (1 << 2)
        VG_IMAGE_QUALITY_FORCE_SIZE                 = VG_MAX_ENUM

    ctypedef enum _VGImageParamType "VGImageParamType":
        VG_IMAGE_FORMAT                             = 0x1E00
        VG_IMAGE_WIDTH                              = 0x1E01
        VG_IMAGE_HEIGHT                             = 0x1E02
        VG_IMAGE_PARAM_TYPE_FORCE_SIZE              = VG_MAX_ENUM

    ctypedef enum _VGImageMode "VGImageMode":
        VG_DRAW_IMAGE_NORMAL                        = 0x1F00
        VG_DRAW_IMAGE_MULTIPLY                      = 0x1F01
        VG_DRAW_IMAGE_STENCIL                       = 0x1F02
        VG_IMAGE_MODE_FORCE_SIZE                    = VG_MAX_ENUM

    ctypedef enum _VGImageChannel "VGImageChannel":
        VG_RED                                      = (1 << 3)
        VG_GREEN                                    = (1 << 2)
        VG_BLUE                                     = (1 << 1)
        VG_ALPHA                                    = (1 << 0)
        VG_IMAGE_CHANNEL_FORCE_SIZE                 = VG_MAX_ENUM

    ctypedef enum _VGBlendMode "VGBlendMode":
        VG_BLEND_SRC                                = 0x2000
        VG_BLEND_SRC_OVER                           = 0x2001
        VG_BLEND_DST_OVER                           = 0x2002
        VG_BLEND_SRC_IN                             = 0x2003
        VG_BLEND_DST_IN                             = 0x2004
        VG_BLEND_MULTIPLY                           = 0x2005
        VG_BLEND_SCREEN                             = 0x2006
        VG_BLEND_DARKEN                             = 0x2007
        VG_BLEND_LIGHTEN                            = 0x2008
        VG_BLEND_ADDITIVE                           = 0x2009
        VG_BLEND_MODE_FORCE_SIZE                    = VG_MAX_ENUM

    ctypedef enum _VGFontParamType "VGFontParamType":
        VG_FONT_NUM_GLYPHS                          = 0x2F00
        VG_FONT_PARAM_TYPE_FORCE_SIZE               = VG_MAX_ENUM

    ctypedef enum _VGHardwareQueryType "VGHardwareQueryType":
        VG_IMAGE_FORMAT_QUERY                       = 0x2100
        VG_PATH_DATATYPE_QUERY                      = 0x2101
        VG_HARDWARE_QUERY_TYPE_FORCE_SIZE           = VG_MAX_ENUM

    ctypedef enum _VGHardwareQueryResult "VGHardwareQueryResult":
        VG_HARDWARE_ACCELERATED                     = 0x2200
        VG_HARDWARE_UNACCELERATED                   = 0x2201
        VG_HARDWARE_QUERY_RESULT_FORCE_SIZE         = VG_MAX_ENUM

    ctypedef enum _VGStringID "VGStringID":
        VG_VENDOR                                   = 0x2300
        VG_RENDERER                                 = 0x2301
        VG_VERSION                                  = 0x2302
        VG_EXTENSIONS                               = 0x2303
        VG_STRING_ID_FORCE_SIZE                     = VG_MAX_ENUM

    
    ###function prototypes ###
    
    _VGErrorCode vgGetError()
    void vgFlush()
    void vgFinish()
    ###/* Getters and Setters */
    void vgSetf (_VGParamType type, _VGfloat value)
    void vgSeti (_VGParamType type, _VGint value)
    void vgSetfv(_VGParamType type, _VGint count,
                         _VGfloat * values)
    void vgSetiv(_VGParamType type, _VGint count,
                         _VGint * values)

    _VGfloat vgGetf(_VGParamType type)
    _VGint vgGeti(_VGParamType type)
    _VGint vgGetVectorSize(_VGParamType type)
    void vgGetfv(_VGParamType type, _VGint count, _VGfloat * values)
    void vgGetiv(_VGParamType type, _VGint count, _VGint * values)

    void vgSetParameterf(_VGHandle object,
                                 _VGint paramType,
                                 _VGfloat value)
    void vgSetParameteri(_VGHandle object,
                                 _VGint paramType,
                                 _VGint value)
    void vgSetParameterfv(_VGHandle object,
                                  _VGint paramType,
                                  _VGint count, _VGfloat * values)
    void vgSetParameteriv(_VGHandle object,
                                  _VGint paramType,
                                  _VGint count, _VGint * values)

    _VGfloat vgGetParameterf(_VGHandle object,
                                    _VGint paramType)
    _VGint vgGetParameteri(_VGHandle object,
                                  _VGint paramType)
    _VGint vgGetParameterVectorSize(_VGHandle object,
                                           _VGint paramType)
    void vgGetParameterfv(_VGHandle object,
                                  _VGint paramType,
                                  _VGint count, _VGfloat * values)
    void vgGetParameteriv(_VGHandle object,
                                  _VGint paramType,
                                  _VGint count, _VGint * values)

    ###/* Matrix Manipulation */
    void vgLoadIdentity()
    void vgLoadMatrix(_VGfloat * m)
    void vgGetMatrix(_VGfloat * m)
    void vgMultMatrix(_VGfloat * m)
    void vgTranslate(_VGfloat tx, _VGfloat ty)
    void vgScale(_VGfloat sx, _VGfloat sy)
    void vgShear(_VGfloat shx, _VGfloat shy)
    void vgRotate(_VGfloat angle)

    ###/* Masking and Clearing */
    void vgMask(_VGHandle mask, _VGMaskOperation operation,
                                     _VGint x, _VGint y,
                                     _VGint width, _VGint height)
    void vgRenderToMask(_VGPath path,
                                            _VGbitfield paintModes,
                                            _VGMaskOperation operation)
    _VGMaskLayer vgCreateMaskLayer(_VGint width, _VGint height)
    void vgDestroyMaskLayer(_VGMaskLayer maskLayer)
    void vgFillMaskLayer(_VGMaskLayer maskLayer,
                                             _VGint x, _VGint y,
                                             _VGint width, _VGint height,
                                             _VGfloat value)
    void vgCopyMask(_VGMaskLayer maskLayer,
                                        _VGint dx, _VGint dy,
                                        _VGint sx, _VGint sy,
                                        _VGint width, _VGint height)
    void vgClear(_VGint x, _VGint y, _VGint width, _VGint height)

    ###/* Paint */
    _VGPaint vgCreatePaint()
    void vgDestroyPaint(_VGPaint paint)
    void vgSetPaint(_VGPaint paint, _VGbitfield paintModes)
    _VGPaint vgGetPaint(_VGPaintMode paintMode)
    void vgSetColor(_VGPaint paint, _VGuint rgba)
    _VGuint vgGetColor(_VGPaint paint)
    void vgPaintPattern(_VGPaint paint, _VGImage pattern)

    ###/* Images */
    _VGImage vgCreateImage(_VGImageFormat format,
                                  _VGint width, _VGint height,
                                  _VGbitfield allowedQuality)
    void vgDestroyImage(_VGImage image)
    void vgClearImage(_VGImage image,
                              _VGint x, _VGint y, _VGint width, _VGint height)
    void vgImageSubData(_VGImage image,   ###does this function set the data?###
                                void * data, _VGint dataStride,
                                _VGImageFormat dataFormat,
                                _VGint x, _VGint y, _VGint width, _VGint height)
    void vgGetImageSubData(_VGImage image,
                                   void * data, _VGint dataStride,
                                   _VGImageFormat dataFormat,
                                   _VGint x, _VGint y,
                                   _VGint width, _VGint height)
    _VGImage vgChildImage(_VGImage parent,
                                 _VGint x, _VGint y, _VGint width, _VGint height)
    _VGImage vgGetParent(_VGImage image) 
    void vgCopyImage(_VGImage dst, _VGint dx, _VGint dy,
                             _VGImage src, _VGint sx, _VGint sy,
                             _VGint width, _VGint height,
                             _VGboolean dither)
    void vgDrawImage(_VGImage image)
    void vgSetPixels(_VGint dx, _VGint dy,
                             _VGImage src, _VGint sx, _VGint sy,
                             _VGint width, _VGint height)
    void vgWritePixels(void * data, _VGint dataStride,
                               _VGImageFormat dataFormat,
                               _VGint dx, _VGint dy,
                               _VGint width, _VGint height)
    void vgGetPixels(_VGImage dst, _VGint dx, _VGint dy,
                             _VGint sx, _VGint sy,
                             _VGint width, _VGint height)
    void vgReadPixels(void * data, _VGint dataStride,
                              _VGImageFormat dataFormat,
                              _VGint sx, _VGint sy,
                              _VGint width, _VGint height)
    void vgCopyPixels(_VGint dx, _VGint dy,
                              _VGint sx, _VGint sy,
                              _VGint width, _VGint height)

    ###/* Text */
    _VGFont vgCreateFont(_VGint glyphCapacityHint)
    void vgDestroyFont(_VGFont font)
    void vgSetGlyphToPath(_VGFont font,
                                              _VGuint glyphIndex,
                                              _VGPath path,
                                              _VGboolean isHinted,
                                              _VGfloat glyphOrigin [2],
                                              _VGfloat escapement[2])
    void vgSetGlyphToImage(_VGFont font,
                                               _VGuint glyphIndex,
                                               _VGImage image,
                                               _VGfloat glyphOrigin [2],
                                               _VGfloat escapement[2])
    void vgClearGlyph(_VGFont font,_VGuint glyphIndex)
    void vgDrawGlyph(_VGFont font, 
                                         _VGuint glyphIndex,
                                         _VGbitfield paintModes,
                                         _VGboolean allowAutoHinting)
    void vgDrawGlyphs(_VGFont font,
                                          _VGint glyphCount,
                                          _VGuint *glyphIndices,
                                          _VGfloat *adjustments_x,
                                          _VGfloat *adjustments_y,
                                          _VGbitfield paintModes,
                                          _VGboolean allowAutoHinting)

    ###/* Image Filters */
    void vgColorMatrix(_VGImage dst, _VGImage src,
                               _VGfloat * matrix)
    void vgConvolve(_VGImage dst, _VGImage src,
                            _VGint kernelWidth, _VGint kernelHeight,
                            _VGint shiftX, _VGint shiftY,
                            _VGshort * kernel,
                            _VGfloat scale,
                            _VGfloat bias,
                            _VGTilingMode tilingMode)
    void vgSeparableConvolve(_VGImage dst, _VGImage src,
                                     _VGint kernelWidth,
                                     _VGint kernelHeight,
                                     _VGint shiftX, _VGint shiftY,
                                     _VGshort * kernelX,
                                     _VGshort * kernelY,
                                     _VGfloat scale,
                                     _VGfloat bias,
                                     _VGTilingMode tilingMode)
    void vgGaussianBlur(_VGImage dst, _VGImage src,
                                _VGfloat stdDeviationX,
                                _VGfloat stdDeviationY,
                                _VGTilingMode tilingMode)
    void vgLookup(_VGImage dst, _VGImage src,
                          _VGubyte * redLUT,
                          _VGubyte * greenLUT,
                          _VGubyte * blueLUT,
                          _VGubyte * alphaLUT,
                          _VGboolean outputLinear,
                          _VGboolean outputPremultiplied)
    void vgLookupSingle(_VGImage dst, _VGImage src,
                                _VGuint * lookupTable,
                                _VGImageChannel sourceChannel,
                                _VGboolean outputLinear,
                                _VGboolean outputPremultiplied)

    ###/* Hardware Queries */
    _VGHardwareQueryResult vgHardwareQuery(_VGHardwareQueryType key,
                                                  _VGint setting)

    ###/* Renderer and Extension Information */
    _VGubyte * vgGetString(_VGStringID name)

    ### /*Path creation and manipulation */
    _VGPath vgCreatePath(_VGint pathFormat,
                                _VGPathDatatype datatype,
                                _VGfloat scale, _VGfloat bias,
                                _VGint segmentCapacityHint,
                                _VGint coordCapacityHint,
                                _VGbitfield capabilities)
    void vgClearPath(_VGPath path, _VGbitfield capabilities)
    void vgDestroyPath(_VGPath path)
    void vgRemovePathCapabilities(_VGPath path,
                                  _VGbitfield capabilities)
    _VGbitfield vgGetPathCapabilities(_VGPath path)
    void vgAppendPath(_VGPath dstPath, _VGPath srcPath)
    void vgAppendPathData(_VGPath dstPath,
                                  _VGint numSegments,
                                  _VGubyte * pathSegments,
                                  void * pathData)
    void vgModifyPathCoords(_VGPath dstPath, _VGint startIndex,
                                    _VGint numSegments,
                                    void * pathData)
    void vgTransformPath(_VGPath dstPath, _VGPath srcPath)
    _VGboolean vgInterpolatePath(_VGPath dstPath,
                                        _VGPath startPath,
                                        _VGPath endPath,
                                        _VGfloat amount)
    _VGfloat vgPathLength(_VGPath path,
                                 _VGint startSegment, _VGint numSegments)
    void vgPointAlongPath(_VGPath path,
                                  _VGint startSegment, _VGint numSegments,
                                  _VGfloat distance,
                                  _VGfloat * x, _VGfloat * y,
                                  _VGfloat * tangentX, _VGfloat * tangentY)
    void vgPathBounds(_VGPath path,
                              _VGfloat * minX, _VGfloat * minY,
                              _VGfloat * width, _VGfloat * height)
    void vgPathTransformedBounds(_VGPath path,
                                         _VGfloat * minX, _VGfloat * minY,
                                         _VGfloat * width, _VGfloat * height)
    void vgDrawPath(_VGPath path, _VGbitfield paintModes)
    
    
###Extension classes ###

cdef class Handle:
    cdef:
        _VGHandle _vg_handle

cdef class Path(Handle):
    pass
    #cdef:
    #    _VGPath _vg_handle #handle to the path structure
    
cdef class Font(Handle):
    pass
    #cdef:
    #    _VGFont _vg_handle 

cdef class Paint(Handle):
    pass
    #cdef:
    #    _VGPaint _vg_handle
        
cdef class Image(Handle):
    pass
    #cdef:
    #    _VGImage _vg_handle
        
cdef class MaskLayer(Handle):
    pass
    #cdef:
    #    _VGMaskLayer _vg_handle
