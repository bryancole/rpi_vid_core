
from libc.stdlib cimport malloc, free

cdef extern from "/opt/vc/include/EGL/egl.h":
    ctypedef int EGLint ###maybe wrong
    ctypedef unsigned int EGLBoolean
    ctypedef unsigned int EGLenum
    ctypedef void *EGLNativeDisplayType
    ctypedef void *EGLNativePixmapType
    ctypedef void *EGLNativeWindowType
    ctypedef void *EGLConfig
    ctypedef void *EGLContext
    ctypedef void *EGLDisplay
    ctypedef void *EGLSurface
    ctypedef void *EGLClientBuffer
    
    EGLint eglGetError()
    EGLDisplay eglGetDisplay(EGLNativeDisplayType display_id)
    EGLBoolean eglInitialize(EGLDisplay dpy, EGLint *major, EGLint *minor)
    EGLBoolean eglTerminate(EGLDisplay dpy)
    char * eglQueryString(EGLDisplay dpy, EGLint name)
    EGLBoolean eglGetConfigs(EGLDisplay dpy, EGLConfig *configs,
			 EGLint config_size, EGLint *num_config)
    EGLBoolean eglChooseConfig(EGLDisplay dpy, const EGLint *attrib_list,
			   EGLConfig *configs, EGLint config_size,
			   EGLint *num_config)
    EGLBoolean eglGetConfigAttrib(EGLDisplay dpy, EGLConfig config,
			      EGLint attribute, EGLint *value)
    EGLSurface eglCreateWindowSurface(EGLDisplay dpy, EGLConfig config,
				  EGLNativeWindowType win,
				  const EGLint *attrib_list)
    EGLSurface eglCreatePbufferSurface(EGLDisplay dpy, EGLConfig config,
				   const EGLint *attrib_list)
    EGLSurface eglCreatePixmapSurface(EGLDisplay dpy, EGLConfig config,
				  EGLNativePixmapType pixmap,
				  const EGLint *attrib_list)
    EGLBoolean eglDestroySurface(EGLDisplay dpy, EGLSurface surface)
    EGLBoolean eglQuerySurface(EGLDisplay dpy, EGLSurface surface,
			   EGLint attribute, EGLint *value)
    EGLBoolean eglBindAPI(EGLenum api)
    EGLenum eglQueryAPI()
    EGLBoolean eglWaitClient()
    EGLBoolean eglReleaseThread()
    EGLSurface eglCreatePbufferFromClientBuffer(
	      EGLDisplay dpy, EGLenum buftype, EGLClientBuffer buffer,
	      EGLConfig config, EGLint *attrib_list)
    EGLBoolean eglSurfaceAttrib(EGLDisplay dpy, EGLSurface surface,
			    EGLint attribute, EGLint value)
    EGLBoolean eglBindTexImage(EGLDisplay dpy, EGLSurface surface, EGLint buffer)
    EGLBoolean eglReleaseTexImage(EGLDisplay dpy, EGLSurface surface, EGLint buffer)
    EGLBoolean eglSwapInterval(EGLDisplay dpy, EGLint interval)
    EGLContext eglCreateContext(EGLDisplay dpy, EGLConfig config,
			    EGLContext share_context,
			    EGLint *attrib_list)
    EGLBoolean eglDestroyContext(EGLDisplay dpy, EGLContext ctx)
    EGLBoolean eglMakeCurrent(EGLDisplay dpy, EGLSurface draw,
			  EGLSurface read, EGLContext ctx)
    EGLContext eglGetCurrentContext()
    EGLSurface eglGetCurrentSurface(EGLint readdraw)
    EGLDisplay eglGetCurrentDisplay()
    EGLBoolean eglQueryContext(EGLDisplay dpy, EGLContext ctx,
			   EGLint attribute, EGLint *value)
    EGLBoolean eglWaitGL()
    EGLBoolean eglWaitNative(EGLint engine)
    EGLBoolean eglSwapBuffers(EGLDisplay dpy, EGLSurface surface)
    EGLBoolean eglCopyBuffers(EGLDisplay dpy, EGLSurface surface,
			  EGLNativePixmapType target)

class CONST:
    EGL_OPENGL_ES_API = 0x30A0
    EGL_OPENVG_API	=	0x30A1
    EGL_OPENGL_API	=	0x30A2
    
    EGL_BUFFER_SIZE	=		0x3020
    EGL_ALPHA_SIZE	=		0x3021
    EGL_BLUE_SIZE	=		0x3022
    EGL_GREEN_SIZE	=		0x3023
    EGL_RED_SIZE	=		0x3024
    EGL_DEPTH_SIZE	=		0x3025
    EGL_STENCIL_SIZE=		0x3026
    EGL_CONFIG_CAVEAT	=	0x3027
    EGL_CONFIG_ID		=	0x3028
    EGL_LEVEL	=		0x3029
    EGL_MAX_PBUFFER_HEIGHT	=	0x302A
    EGL_MAX_PBUFFER_PIXELS	=	0x302B
    EGL_MAX_PBUFFER_WIDTH	=	0x302C
    EGL_NATIVE_RENDERABLE	=	0x302D
    EGL_NATIVE_VISUAL_ID	=	0x302E
    EGL_NATIVE_VISUAL_TYPE	=	0x302F
    EGL_SAMPLES		=	0x3031
    EGL_SAMPLE_BUFFERS	=	0x3032
    EGL_SURFACE_TYPE	=	0x3033
    EGL_TRANSPARENT_TYPE	=	0x3034
    EGL_TRANSPARENT_BLUE_VALUE=	0x3035
    EGL_TRANSPARENT_GREEN_VALUE=	0x3036
    EGL_TRANSPARENT_RED_VALUE=	0x3037
    EGL_NONE	=		0x3038	#/* Attrib list terminator */
    EGL_BIND_TO_TEXTURE_RGB	=	0x3039
    EGL_BIND_TO_TEXTURE_RGBA=	0x303A
    EGL_MIN_SWAP_INTERVAL	=	0x303B
    EGL_MAX_SWAP_INTERVAL	=	0x303C
    EGL_LUMINANCE_SIZE	=	0x303D
    EGL_ALPHA_MASK_SIZE	=	0x303E
    EGL_COLOR_BUFFER_TYPE	=	0x303F
    EGL_RENDERABLE_TYPE	=	0x3040
    EGL_MATCH_NATIVE_PIXMAP	=	0x3041	#/* Pseudo-attribute (not queryable) */
    EGL_CONFORMANT	=		0x3042
    
_context_reg = {}
    
cdef class Context:
    cdef EGLContext _eglcontext
    
_display_reg = {}
    
cdef class Display:
    cdef EGLDisplay _egldisplay
    
_surface_reg = {}
    
cdef class Surface:
    cdef EGLSurface _eglsurface
    
_config_reg = {}

cdef class Config:
    cdef EGLConfig _eglconfig
    

class EGLError(Exception):
    codes = {
        0x3000 : 'EGL_SUCCESS'			
        0x3001 : 'EGL_NOT_INITIALIZED'
        0x3002 : 'EGL_BAD_ACCESS'			
        0x3003 : 'EGL_BAD_ALLOC'			
        0x3004 : 'EGL_BAD_ATTRIBUTE'		
        0x3005 : 'EGL_BAD_CONFIG'			
        0x3006 : 'EGL_BAD_CONTEXT'			
        0x3007 : 'EGL_BAD_CURRENT_SURFACE'		
        0x3008 : 'EGL_BAD_DISPLAY'			
        0x3009 : 'EGL_BAD_MATCH'			
        0x300A : 'EGL_BAD_NATIVE_PIXMAP'		
        0x300B : 'EGL_BAD_NATIVE_WINDOW'		
        0x300C : 'EGL_BAD_PARAMETER'		
        0x300D : 'EGL_BAD_SURFACE'			
        0x300E : 'EGL_CONTEXT_LOST'			
        }

def raise_egl_error():
    err_code = getError()
    raise EGLError("%s (code x%x)"%(EGLError.codes[err_code], err_code))
    
def getError():
    return int(eglGetError())
    
def BindAPI(EGLenum api):
    cdef:
        EGLBoolean ret
    ret = eglBindAPI(api)
    return bool(ret)

def GetDisplay(EGLNativeDisplayType display_id):
    cdef:
        EGLDisplay display
        Display py_display
    display = eglGetDisplay(display_id)
    if display == EGL_NO_DISPLAY:
        raise EGLError("No display available")
    py_display = Display()
    py_display._egldisplay = display
    _display_reg[<int>display] = py_display
    return py_display
    
def Initialise(Display dpy):
    cdef:
        EGLint major
        EGLint minor
        EGLBoolean ret
    ret = eglInitialize(dpy._egldisplay, &major, &minor)
    if ret == EGL_FALSE:
        raise_egl_error()
    return (int(major), int(minor))
    
def Terminate(Display dpy):
    if eglTerminate(dpy._egldisplay) == EGL_FALSE:
        raise_egl_error()

def QueryString(Display dpy, EGLint name):
    cdef char *data
    data = eglQueryString(dpy._egldisplay, name)
    return data
    
def GetConfigs(Display dpy):
    cdef:
        EGLint numConfigs = -1
    if eglGetConfigs(dpy._egldisplay, NULL, 0, &numConfigs)==EGL_FALSEL
        raise_egl_error()
    return int(numConfigs)

### Not implemented the other calling method for this ###    
#    EGLBoolean eglGetConfigs(EGLDisplay dpy, EGLConfig *configs,
#			 EGLint config_size, EGLint *num_config)
             
def ChooseConfig(Display dpy, list attrib_list, EGLint config_size):
    cdef:
        EGLConfig *configs
        EGLint num_configs
        EGLint *attribs
        int i, n_attrib=len(attrib_list)
        
    attribs = <EGLint*>malloc(sizeof(EGLint)*n_attrib)
    configs = <EGLConfig*>malloc(sizeof(EGLConfig)*config_size)
    try:
        for i in xrange(n_attrib):
            attribs[i] = attrib_list[i]

        if eglChooseConfig(dpy._egldisplay, attribs,
                   configs, config_size, &num_config) == EGL_FALSE:
            raise_egl_error()
        chosen = []
        for i in xrange(num_config):
            cfg = Config()
            cfg._eglconfig = configs[i]
            chosen.append(cfg)
        return chosen
    finally:
        free(attribs)
        free(configs)
        
def GetConfigAttrib(Display dpy, Config config, EGLint attribute):
    cdef EGLint value
    if eglGetConfigAttrib(dpy._egldisplay, config._eglconfig,
			      attribute, &value) == EGL_FALSE:
        raise_egl_error()
    return int(value)
    
def CreateWindowSurface(Display dpy, Config config, EGLNativeWindowType win,
                        list attrib_list):
    cdef:
        EGLSurface surf
        EGLint *attribs
        int i, n_attrib=len(attrib_list)
        
    attribs = <EGLint*>malloc(sizeof(EGLint)*n_attrib)
    try:
        for i in xrange(n_attrib):
            attribs[i] = attrib_list[i]
        
        surf = eglCreateWindowSurface(dpy._egldisplay, config._eglconfig,
                      win, attribs)
        if surf == EGL_NO_SURFACE:
            raise_egl_error()
        py_surf = Surface()
        py_surf._eglsurface = surf
        return py_surf
    finally:
        free(attribs)
                  
                  
    EGLSurface eglCreatePbufferSurface(EGLDisplay dpy, EGLConfig config,
				   const EGLint *attrib_list)
    EGLSurface eglCreatePixmapSurface(EGLDisplay dpy, EGLConfig config,
				  EGLNativePixmapType pixmap,
				  const EGLint *attrib_list)
    EGLBoolean eglDestroySurface(EGLDisplay dpy, EGLSurface surface)
    EGLBoolean eglQuerySurface(EGLDisplay dpy, EGLSurface surface,
			   EGLint attribute, EGLint *value)
    EGLBoolean eglBindAPI(EGLenum api)
    EGLenum eglQueryAPI()
    EGLBoolean eglWaitClient()
    EGLBoolean eglReleaseThread()
    EGLSurface eglCreatePbufferFromClientBuffer(
	      EGLDisplay dpy, EGLenum buftype, EGLClientBuffer buffer,
	      EGLConfig config, EGLint *attrib_list)
    EGLBoolean eglSurfaceAttrib(EGLDisplay dpy, EGLSurface surface,
			    EGLint attribute, EGLint value)
    EGLBoolean eglBindTexImage(EGLDisplay dpy, EGLSurface surface, EGLint buffer)
    EGLBoolean eglReleaseTexImage(EGLDisplay dpy, EGLSurface surface, EGLint buffer)
    EGLBoolean eglSwapInterval(EGLDisplay dpy, EGLint interval)
    EGLContext eglCreateContext(EGLDisplay dpy, EGLConfig config,
			    EGLContext share_context,
			    EGLint *attrib_list)
    EGLBoolean eglDestroyContext(EGLDisplay dpy, EGLContext ctx)
    EGLBoolean eglMakeCurrent(EGLDisplay dpy, EGLSurface draw,
			  EGLSurface read, EGLContext ctx)
    EGLContext eglGetCurrentContext()
    EGLSurface eglGetCurrentSurface(EGLint readdraw)
    EGLDisplay eglGetCurrentDisplay()
    EGLBoolean eglQueryContext(EGLDisplay dpy, EGLContext ctx,
			   EGLint attribute, EGLint *value)
    EGLBoolean eglWaitGL()
    EGLBoolean eglWaitNative(EGLint engine)
    EGLBoolean eglSwapBuffers(EGLDisplay dpy, EGLSurface surface)
    EGLBoolean eglCopyBuffers(EGLDisplay dpy, EGLSurface surface,
			  EGLNativePixmapType target)